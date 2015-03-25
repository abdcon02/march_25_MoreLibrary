<?php
    class Author
    {
        private $name;
        private $id;

// Constructor of Class
        function __construct($name, $id = null)
        {
            $this->name = $name;
            $this->id = $id;
        }
// Getters and Setters for private properties
        function getName()
        {
            return $this->name;
        }
        function setName($new_name)
        {
            $this->name = (string) $new_name;
        }
        function getId()
        {
            return $this->id;
        }
        function setId($new_id)
        {
            $this->id = (int) $new_id;
        }
// Methods to interact with Database
        function save()
        {
            $statement = $GLOBALS['DB']->query("INSERT INTO authors (name) VALUES ('{$this->getName()}') RETURNING id;");
            $result = $statement ->fetch(PDO::FETCH_ASSOC);
            $this->setId($result['id']);
        }

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM authors;");
            $all_authors = array();
            foreach($statement as $person){
                $name = $person['name'];
                $id = $person['id'];
                $new_author = new Author($name, $id);
                array_push($all_authors, $new_author);
            }
            return $all_authors;
        }

        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM authors *;");
        }

        static function find($search_id)
        {
            $found_author = null;
            $authors = Author::getAll();
            foreach($authors as $person){
                if ($person->getId() == $search_id) {
                    $found_author = $book;
                }
            }
            return $found_author;
        }

        function update($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE authors SET name = '{$new_name}' WHERE id = {$this->getId()};");
            $this->setName($new_name);
        }

        function delete()
        {
            $GLOBALS['DB']->exec("DELETE FROM authors WHERE id = {$this->getId()};");
            $GLOBALS['DB']->exec("DELETE FROM books_authors WHERE author_id = {$this->getId()};");
        }

        function getBooks()
        {
            $query = $GLOBALS['DB']->query("SELECT books.* FROM
                authors JOIN books_authors ON (authors.id = books_authors.author_id)
                JOIN books ON (books_authors.book_id = books.id)
                WHERE authors.id={$this->getId()};");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $books_by_author = array();
                foreach($result as $book) {
                    $name = $book['name'];
                    $id = $book['id'];
                    $new_book = new Book($name, $id);
                    array_push($books_by_author, $new_book);
                }
            }
            return $books_by_author;
        }


        function addAuthor($book)
        {
            $GLOBALS['DB']->exec("INSERT INTO books_authors (author_id, book_id) VALUES ({$this->getId()}, {$book->getId()});");
        }

    }



 ?>
