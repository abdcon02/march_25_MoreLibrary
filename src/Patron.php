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
        }

        function getCopy()
        {
            $query = $GLOBALS['DB']->query("SELECT copies.* FROM
                patrons JOIN checkout ON (patrons.id = checkout.patron_id)
                JOIN copies ON (checkout.copy_id = copies.id)
                WHERE patrons.id={$this->getId()} AND in_library = 1;");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $copy_to_checkout = array();
            foreach($result as $book) {
                $name = $book['name'];
                $id = $book['id'];
                $new_book = new Book($name, $id);
                array_push($copies_to_checkout, $new_book);
            }

            return $copies_to_checkout;
        }


        function addCopy($copy)
        {
            $GLOBALS['DB']->exec("INSERT INTO books_authors (author_id, book_id) VALUES ({$this->getId()}, {$book->getId()});");
        }

    }



 ?>
