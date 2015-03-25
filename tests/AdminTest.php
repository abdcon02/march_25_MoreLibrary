<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Admin.php";

    $DB = new PDO('pgsql:host=localhost;dbname=library_test');

    class AdminTest extends PHPUnit_Framework_TestCase
    {
        protected function tearDown()
        {
            Admin::deleteAll();
        }

        function test_SetName()
        {
            //Arrange
            $name = "Dandy";
            $test_admin = new Admin($name);
            $new_name = "Terry";

            //Act
            $test_admin->setName($new_name);
            $result = $test_admin->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_SetId()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_admin = new Admin($name, $id);
            $new_id = 2;

            //Act
            $test_admin->setId($new_id);
            $result = $test_admin->getId();

            //Assert
            $this->assertEquals($new_id, $result);
        }

        function test_SetPassword()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_admin = new Admin($name, $id);
            $new_password = "hey there";

            //Act
            $test_admin->setPassword($new_password);
            $result = $test_admin->getPassword();

            //Assert
            $this->assertEquals($new_password, $result);
        }

        function test_save()
        {
            //Arrange
            $name = "Hemmingway";
            $test_admin = new Admin($name);

            //Act
            $test_admin->save();
            $result = Admin::getAll();

            //Assert
            $this->assertEquals($test_admin, $result[0]);

        }

        function test_getAll()
        {
            //Arrange
            $name = "Bogus";
            $test_admin = new Admin($name);
            $test_admin->save();

            $name2 = "Wendy";
            $test_admin2 = new Admin($name2);
            $test_admin2->save();

            //Act
            $result = Admin::getAll();

            //Assert
            $this->assertEquals([$test_admin, $test_admin2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "Freddy";
            $test_admin = new Admin($name);
            $test_admin->save();

            //Act
            Admin::deleteAll();
            $result = Admin::getAll();

            //Assert
            $this->assertEquals([], $result);
        }



        function test_updateName()
        {
            //Arrange
            $name = "asdfasdf";
            $test_admin = new Admin($name);
            $test_admin->save();

            $new_name = "Poppy";

            //Act
            $test_admin->updateName($new_name);

            //Assert
            $this->assertEquals($new_name, $test_admin->getName());

        }

        function test_updatePassword()
        {
            //Arrange
            $name = "Poppy";
            $id = null;
            $password = "hey";
            $test_admin = new Admin($name, $id, $password);
            $test_admin->save();

            $new_password = "how";

            //Act
            $test_admin->updatePassword($new_password);

            //Assert
            $this->assertEquals($new_name, $test_admin->getPassword());

        }

        function test_delete()
        {
            //Arrange
            $name = "Zed";
            $test_admin = new Admin($name);
            $test_admin->save();

            $name2 = "Fred";
            $test_admin2 = new Admin($name2);
            $test_admin2->save();

            //Act
            $test_admin2->delete();
            $result = Admin::getAll();

            //Assert
            $this->assertEquals([$test_admin], $result);
        }


    }

?>
