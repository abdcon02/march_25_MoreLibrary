<?php
    class Copy
    {
        private $book_name;
        private $id;
        private $in_library;
        private $book_id;

// Constructor of Class
        function __construct($book_name, $id = null, $in_library = true, $book_id = null)
        {
            $this->book_name = $book_name;
            $this->id = $id;
            $this->in_library = $in_library;
            $this->book_id = $book_id;

        }
// Getters and Setters for private properties
        function getBookName()
        {
            return $this->book_name;
        }
        function setBookName($new_name)
        {
            $this->book_name = (string) $new_name;
        }
        function getId()
        {
            return $this->id;
        }
        function setId($new_id)
        {
            $this->id = (int) $new_id;
        }
        function getIn_library()
        {
            return $this->in_library;
        }
        function setIn_library($new)
        {
            $this->in_library = (bool) $new;
        }
        function getBook_id()
        {
            return $this->book_id;
        }
        function setBook_id($new_id)
        {
            $this->book_id = (int) $new_id;
        }
// Methods to interact with Database

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM copies;");
            $all_copies = array();
            foreach($statement as $book){
                $name = $book['book_name'];
                $id = $book['id'];
                $in = $book['in_library'];
                $book_id = $book['book_id'];
                $new_book = new Copy($name, $id, $in, $book_id);
                array_push($all_copies, $new_book);
            }
            return $all_copies;
        }

        static function find($search_name)
        {
            $found_book = null;
            $books = Copy::getAll();
            foreach($books as $book){
                if ($book->getBookName() == $search_name) {
                    $found_book = $book;
                }
            }
            return $found_book;
        }

    }



 ?>
