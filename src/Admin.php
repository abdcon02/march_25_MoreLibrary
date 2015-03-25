<?php
    class Admin
    {
        private $name;
        private $password;
        private $id;
// Constructor of Class
        function __construct($name, $id = 0, $password = "admin")
        {
            $this->name = $name;
            $this->id = $id;
            $this->password = $password;
        }
//Create getter and setter
        function getName()
        {
            return $this->name;
        }
        function setName($new_name)
        {
            $this->name = (string) $new_name;
        }
        function getPassword()
        {
            return $this->password;
        }
        function setPassword($new_password)
        {
            $this->password = (string) $new_password;
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
            $statement = $GLOBALS['DB']->query("INSERT INTO admin (name, password) VALUES ('{$this->getName()}','{$this->getPassword()}') RETURNING id;");
            $result = $statement ->fetch(PDO::FETCH_ASSOC);
            $this->setId($result['id']);
        }

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM admin;");
            $all_admin = array();
            foreach($statement as $person){
                $name = $person['name'];
                $id = $person['id'];
                $password = $person['password'];
                $new_admin = new Admin($name,$id,$password);
                array_push($all_admin, $new_admin);
            }
            return $all_admin;
        }

        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM admin *;");
        }


        function updateName($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE admin SET name = '{$new_name}' WHERE id = {$this->getId()};");
            $this->setName($new_name);
        }

        function updatePassword($new_password)
        {
            $GLOBALS['DB']->exec("UPDATE admin SET password = '{$new_password}' WHERE id = {$this->getId()};");
            $this->setPassword($new_password);
        }

        function delete()
        {
            $GLOBALS['DB']->exec("DELETE FROM admin WHERE id = {$this->getId()};");
        }
    }


 ?>
