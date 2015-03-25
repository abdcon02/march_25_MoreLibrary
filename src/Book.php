<?php
    class Book
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
            $statement = $GLOBALS['DB']->query("INSERT INTO books (name) VALUES ('{$this->getName()}') RETURNING id;");
            $result = $statement ->fetch(PDO::FETCH_ASSOC);
            $this->setId($result['id']);
        }

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM books;");
            $all_books = array();
            foreach($statement as $book){
                $name = $book['name'];
                $id = $book['id'];
                $new_book = new Book($name, $id);
                array_push($all_books, $new_book);
            }
            return $all_books;
        }

        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM books *;");
        }

        static function find($search_id)
        {
            $found_book = null;
            $books = Book::getAll();
            foreach($books as $book){
                if ($book->getId() == $search_id) {
                    $found_book = $book;
                }
            }
            return $found_book;
        }

        function update($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE books SET name = '{$new_name}' WHERE id = {$this->getId()};");
            $this->setName($new_name);
        }

        function delete()
        {
            $GLOBALS['DB']->exec("DELETE FROM books WHERE id = {$this->getId()};");
            $GLOBALS['DB']->exec("DELETE FROM books_authors WHERE book_id = {$this->getId()};");
        }

        function getAuthors()
        {
            $query = $GLOBALS['DB']->query("SELECT authors.* FROM
                books JOIN books_authors ON (books.id = books_authors.book_id)
                JOIN authors ON (books_authors.author_id = authors.id)
                WHERE books.id={$this->getId()};");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $authors_of_book = array();
            foreach($result as $author) {
                $name = $author['name'];
                $id = $author['id'];
                $new_author = new Author($name, $id);
                array_push($authors_of_book, $new_author);
            }

            return $authors_of_book;
        }


        function addAuthor($author)
        {
            $GLOBALS['DB']->exec("INSERT INTO books_authors (book_id, author_id) VALUES ({$this->getId()}, {$author->getId()});");
        }

    }



 ?>
