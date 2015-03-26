<?php
    class Patron
    {
        private $name;
        private $password;
        private $id;

// Constructor of Class
        function __construct($name, $id = null, $password = "admin")
        {
            $this->name = $name;
            $this->id = $id;
            $this->password = $password;
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
        function getPassword()
        {
            return $this->password;
        }
        function setPassword($new_password)
        {
            $this->password = (string) $new_password;
        }
// Methods to interact with Database
        function save()
        {
            $statement = $GLOBALS['DB']->query("INSERT INTO patrons (name, password) VALUES ('{$this->getName()}', '{$this->getPassword()}') RETURNING id;");
            $result = $statement ->fetch(PDO::FETCH_ASSOC);
            $this->setId($result['id']);
        }

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM patrons;");
            $all_patrons = array();
            foreach($statement as $person){
                $name = $person['name'];
                $id = $person['id'];
                $password = $person['password'];
                $new_patron = new Patron($name, $id, $password);
                array_push($all_patrons, $new_patron);
            }
            return $all_patrons;
        }

        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM patrons *;");
            $GLOBALS['DB']->exec("DELETE FROM checkout *;");
        }

        static function find($search_id)
        {
            $found_patron = null;
            $patrons = Patron::getAll();
            foreach($patrons as $person){
                if ($person->getId() == $search_id) {
                    $found_patron = $person;
                }
            }
            return $found_patron;
        }

        function updateName($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE patrons SET name = '{$new_name}' WHERE id = {$this->getId()};");
            $this->setName($new_name);
        }

        function updatePassword($new_password)
        {
            $GLOBALS['DB']->exec("UPDATE patrons SET password = '{$new_password}' WHERE id = {$this->getId()};");
            $this->setPassword($new_password);
        }

        function delete()
        {
            $GLOBALS['DB']->exec("DELETE FROM patrons WHERE id = {$this->getId()};");
            $GLOBALS['DB']->exec("DELETE FROM checkout WHERE patron_id = {$this->getId()};");
        }

        function getCheckouts()
        {
            $query = $GLOBALS['DB']->query("SELECT copies.* FROM
                patrons JOIN checkout ON (patrons.id = checkout.patron_id)
                JOIN copies ON (checkout.copy_id = copies.id)
                WHERE patrons.id={$this->getId()};");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $copies_checked_out = array();
            foreach($result as $book) {
                $name = $book['book_name'];
                array_push($copies_checked_out, $name);
            }

            return $copies_checked_out;
        }

// Run this method on a Book that has been created
// Add a due date to checked out book
        function checkoutCopy($name)
        {
            $result = $GLOBALS['DB']->query("SELECT * From copies where book_name = '{$name}' AND in_library = true;");
            $books = $result->fetchAll(PDO::FETCH_ASSOC);

            $copy = new Copy($books[0]['book_name'], $books[0]['id']);

            $day = rand(0,31);
            $month = rand(0,12);
            $due_date = 2015 . "-" . $month . "-" . $day;


            $GLOBALS['DB']->exec("INSERT INTO checkout (patron_id, copy_id) VALUES ({$this->getId()}, {$copy->getId()});");
            $GLOBALS['DB']->exec("UPDATE copies SET in_library = false WHERE id = {$copy->getId()};");
            $GLOBALS['DB']->exec("UPDATE copies SET due_date = {$due_date} WHERE id = {$copy->getId()};");


        }
// Return method runs on book which has a false in_library attribute in the copies table.

// Get all copies with the same name and a false attribute in the in_libraries column.
// Get the id of the first copy that matches
// Update copy in copies table so in_library = true where the copies id is the one found above.
        function returnCopy($name)
        {
            $copies = Copy::getAll();
            // var_dump($copies);
            $copy_to_return = null;
            foreach($copies as $book){
                if($book->getBookName() == $name && $book->getIn_library() == false){
                    $copy_to_return = $book;
                }
            }
            // var_dump($copy_to_return);
            $GLOBALS['DB']->exec("UPDATE copies SET in_library = true WHERE id = {$copy_to_return->getId()};");

        }

        function getCopyDueDate($name)
        {
            $copies

        }

    }



 ?>
