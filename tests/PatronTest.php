<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Patron.php";
    require_once "src/Book.php";
    require_once "src/Copy.php";

    $DB = new PDO('pgsql:host=localhost;dbname=library_test');

    class PatronTest extends PHPUnit_Framework_TestCase
    {
        protected function tearDown()
        {
            Patron::deleteAll();
            Book::deleteAll();
        }

        function test_SetName()
        {
            //Arrange
            $name = "Dandy";
            $test_patron = new Patron($name);
            $new_name = "Terry";

            //Act
            $test_patron->setName($new_name);
            $result = $test_patron->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_SetId()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_patron = new Patron($name, $id);
            $new_id = 2;

            //Act
            $test_patron->setId($new_id);
            $result = $test_patron->getId();

            //Assert
            $this->assertEquals($new_id, $result);
        }

        function test_SetPassword()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_patron = new Patron($name, $id);
            $new_password = "hey there";

            //Act
            $test_patron->setPassword($new_password);
            $result = $test_patron->getPassword();

            //Assert
            $this->assertEquals($new_password, $result);
        }

        function test_save()
        {
            //Arrange
            $name = "Hemmingway";
            $test_patron = new Patron($name);

            //Act
            $test_patron->save();
            $result = Patron::getAll();

            //Assert
            $this->assertEquals($test_patron, $result[0]);

        }

        function test_getAll()
        {
            //Arrange
            $name = "Bogus";
            $test_patron = new Patron($name);
            $test_patron->save();

            $name2 = "Wendy";
            $test_patron2 = new Patron($name2);
            $test_patron2->save();

            //Act
            $result = Patron::getAll();

            //Assert
            $this->assertEquals([$test_patron, $test_patron2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "Freddy";
            $test_patron = new Patron($name);
            $test_patron->save();

            //Act
            Patron::deleteAll();
            $result = Patron::getAll();

            //Assert
            $this->assertEquals([], $result);
        }



        function test_updateName()
        {
            //Arrange
            $name = "asdfasdf";
            $test_patron = new Patron($name);
            $test_patron->save();

            $new_name = "Poppy";

            //Act
            $test_patron->updateName($new_name);

            //Assert
            $this->assertEquals($new_name, $test_patron->getName());

        }

        function test_updatePassword()
        {
            //Arrange
            $name = "Poppy";
            $id = null;
            $password = "hey";
            $test_patron = new Patron($name, $id, $password);
            $test_patron->save();

            $new_password = "how";

            //Act
            $test_patron->updatePassword($new_password);

            //Assert
            $this->assertEquals($new_password, $test_patron->getPassword());

        }

        function test_delete()
        {
            //Arrange
            $name = "Zed";
            $test_patron = new Patron($name);
            $test_patron->save();

            $name2 = "Fred";
            $test_patron2 = new Patron($name2);
            $test_patron2->save();

            //Act
            $test_patron2->delete();
            $result = Patron::getAll();

            //Assert
            $this->assertEquals([$test_patron], $result);
        }

// Create a new Book which will create a new copy of that book in our copy table.
// Create a Patron
// Use the checkout copy method to checkout that copy we made while making the book
// Test result using the get checkouts method
        //
        function test_checkout()
        {
            //Arrange
            $name = "php_book";
            $test_book = new Book($name);
            $test_book->save();

            $patron_name = "Billy Bob";
            $test_patron = new Patron($patron_name);
            $test_patron->save();

            //Act
            $test_patron->checkoutCopy($name);
            $result = $test_patron->getCheckouts();

            //Assert
            $this->assertEquals([$name], $result);
        }

// Create 2 books
// Create a Patron
// Checkout those 2 books with that patron
// See all books that the patron has checked out

        function testAllCheckouts()
        {
            //Arrang
            $name = "Drupal_book";
            $test_book = new Book($name);
            $test_book->save();

            $name2 = "Javascript_book";
            $test_book2 = new Book($name2);
            $test_book2->save();

            $patron_name ="Master Connor";
            $test_patron = new Patron($patron_name);
            $test_patron->save();

            //Action
            $test_patron->checkoutCopy($name);
            $test_patron->checkoutCopy($name2);
            $result = $test_patron->getCheckouts();

            //Assert
            $this->assertEquals([$test_book->getName(),$test_book2->getName()], $result);

        }

// Create 1 book
// Create the same book again
// Create a Patron
// Checkout 1 book
// Test that there is one book checkouted in Copies.

        function testCheckoutSingleCopy()
        {
            //Arrange
            $name = "KidPlay_book";
            $test_book = new Book($name);
            $test_book->save();

            $name2 = "KidPlay_book";
            $test_book2 = new Book($name2);
            $test_book2->save();
            $book2Id = $test_book2->getId();

            $patron_name = "tommy";
            $test_patron = new Patron($patron_name);
            $test_patron->save();

            //Action
            $test_patron->checkoutCopy($name);
            $copies = Copy::getAll();

            $result = $copies[0]->getIn_library();

            //Assert
            $this->assertEquals(true, $result);
        }

// Create two Books & a Patron
// Check out the second book
// Return that book
// Check that all copies attribute in_library = true

        function testReturnBook()
        {
           //Arrange
           $name = "book_air";
           $test_book = new Book($name);
           $test_book->save();

           $name2 = "no_book";
           $test_book2 = new Book($name2);
           $test_book2->save();

           $patron_name = "Tb";
           $test_patron = new Patron($patron_name);
           $test_patron->save();

           //Action
           $test_patron->checkoutCopy($name2);
           $test_patron->returnCopy($test_book2->getId());
           $copies = Copy::getAll();


           //Assert
           $this->assertEquals($copies[1]->getIn_library(), true);
        }

//Create Book & Patron
//Checkout Book

        function testDue_Date()
        {
            //Arrange
            $name = "book_air";
            $test_book = new Book($name);
            $test_book->save();

            $patron_name = "Tb";
            $test_patron = new Patron($patron_name);
            $test_patron->save();

            //Action
            $test_patron->checkoutCopy($name);
            $result = $test_patron->getDueDate($test_book->getId());


            //Assert
            $this->assertEquals( true ,is_string($result));
        }

    }

?>
