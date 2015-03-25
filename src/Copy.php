<?php
    class Copy
    {
        private $book_name;
        private $id;
        private $in_library;

// Constructor of Class
        function __construct($book_name, $id = null, $in_library = true)
        {
            $this->book_name = $book_name;
            $this->id = $id;
            $this->in_library = $in_library;

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
// Methods to interact with Database

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM copies;");
            $all_copies = array();
            foreach($statement as $book){
                $name = $book['book_name'];
                $id = $book['id'];
                $in = $book['in_library'];
                $new_book = new Copy($name, $id, $in);
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
