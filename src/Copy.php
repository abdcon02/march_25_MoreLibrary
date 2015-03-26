<?php
    class Copy
    {
        private $book_name;
        private $id;
        private $in_library;
        private $book_id;
        private $due_date;

// Constructor of Class
        function __construct($book_name, $id = null, $in_library = true, $book_id = null, $due_date = null)
        {
            $this->book_name = $book_name;
            $this->id = $id;
            $this->in_library = $in_library;
            $this->book_id = $book_id;
            $this->due_date = $due_date;

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
        function getDue_date()
        {
            return $this->due_date;
        }
        function setDue_date($new_date)
        {
            $this->due_date = (string) $new_date;
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
                $due_date = $book['due_date'];
                $new_book = new Copy($name, $id, $in, $book_id, $due_date);
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
// Get all copies Where in_library is false
        // static function getAllCheckedOut($book_id)
        // {
        //   $allbooks = Copy::getAll();
        //     foreach($allbooks  as $row)
        //     {
        //      $checkCopy = $GLOBALS["DB"]->query("SELECT * FROM copies WHERE book_id = '{$book_id}' AND in_library = false;");
        //       foreach($checkCopy as $rows)
        //         if($row['due_date'] == $row)
        //     }
        // }

// Get all copies Where due_date is < todays date;
        static function getAllOverdue()
        {
            date_default_timezone_set('America/Los_Angeles');
            $today = date("Y/m/d");
            $result = $GLOBALS["DB"]->query("SELECT * FROM copies WHERE due_date < '{$today}' AND in_library = false;");

            $overdue = $result->fetchAll(PDO::FETCH_ASSOC);
            $overdue_books = array();

            $book_owners = array();

            foreach($overdue as $book){
                $book_name = $book['book_name'];
                $due_date = $book['due_date'];
                $in_library = $book['in_library'];
                $id = $book['id'];
                $book_id = $book['book_id'];
                $new_overdue = new Copy($book_name, $id, $in_library, $book_id, $due_date);
                // array_push($overdue_books, $new_overdue);

                $query = $GLOBALS['DB']->query("SELECT patrons.* FROM
                    copies JOIN checkout ON (copies.id = checkout.copy_id)
                    JOIN patrons ON (checkout.patron_id = patrons.id)
                    WHERE copies.id={$id};");
                    $result = $query->fetch(PDO::FETCH_ASSOC);
                    $patron = $result['name'];

            $book_owners[$patron] = $new_overdue;


            }
            var_dump($book_owners);



            return($book_owners);
        }

    }



 ?>
