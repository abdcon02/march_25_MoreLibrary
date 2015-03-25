<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Book.php";
    require_once "src/Book.php";


    $DB = new PDO('pgsql:host=localhost;dbname=library_test');

    class BookTest extends PHPUnit_Framework_TestCase
    {
        protected function tearDown()
        {
            Book::deleteAll();
            Author::deleteAll();
        }

        function test_GetName()
        {
            //Arrange
            $name = "Walt Whitman";
            $test_book = new Book($name);

            //Act
            $result = $test_book->getName();

            //Assert
            $this->assertEquals($name, $result);
        }

        function test_SetName()
        {
            //Arrange
            $name = "Dandy";
            $test_book = new Book($name);
            $new_name = "Terry";

            //Act
            $test_book->setName($new_name);
            $result = $test_book->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_GetId()
        {
            //Arrange
            $name = "Frank";
            $id = 1;
            $test_book = new Book($name, $id);

            //Act
            $result = $test_book->getId();

            //Assert
            $this->assertEquals($id, $result);
        }

        function test_SetId()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_book = new Book($name, $id);
            $new_id = 2;

            //Act
            $test_book->setId($new_id);
            $result = $test_book->getId();

            //Assert
            $this->assertEquals($new_id, $result);
        }

        function test_save()
        {
            //Arrange
            $name = "Hemmingway";
            $test_book = new Book($name);

            //Act
            $test_book->save();
            $result = Book::getAll();

            //Assert
            $this->assertEquals($test_book, $result[0]);

        }

        function test_getAll()
        {
            //Arrange
            $name = "Bogus";
            $test_book = new Book($name);
            $test_book->save();

            $name2 = "Wendy";
            $test_book2 = new Book($name2);
            $test_book2->save();

            //Act
            $result = Book::getAll();

            //Assert
            $this->assertEquals([$test_book, $test_book2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "Freddy";
            $test_book = new Book($name);
            $test_book->save();

            //Act
            Book::deleteAll();
            $result = Book::getAll();

            //Assert
            $this->assertEquals([], $result);
        }

        function test_find()
        {
            //Arrange
            $name = "Tommy";
            $test_book = new Book($name);
            $test_book->save();

            $name2 = "Connor";
            $test_book2 = new Book($name2);
            $test_book2->save();

            //Act
            $result = Book::find($test_book2->getId());

            //Assert
            $this->assertEquals($test_book2, $result);
        }

        function test_update()
        {
            //Arrange
            $name = "asdfasdf";
            $test_book = new Book($name);
            $test_book->save();

            $new_name = "Poppy";

            //Act
            $test_book->update($new_name);

            //Assert
            $this->assertEquals($new_name, $test_book->getName());

        }

        function test_delete()
        {
            //Arrange
            $name = "Zed";
            $test_book = new Book($name);
            $test_book->save();

            $name2 = "Fred";
            $test_book2 = new Book($name2);
            $test_book2->save();

            //Act
            $test_book2->delete();
            $result = Book::getAll();

            //Assert
            $this->assertEquals([$test_book], $result);
        }

        function testAddAuthor()
        {
            //Arrange
            $author = "Tim";
            $test_author = new Author($author);
            $test_author->save();

            $book_name = "PHP";
            $test_book = new Book($book_name);
            $test_book->save();

            //Act
            $test_book->addAuthor($test_author);
            $result = $test_book->getAuthors();

            //Assert
            $this->assertEquals([$test_author], $result);
        }

        function testGetAuthors()
        {
            //Arrange
            $name = "Debra Burnheart";
            $test_author = new Author($name);
            $test_author->save();

            $name2 = "Howie Day";
            $test_author2 = new Author($name2);
            $test_author2->save();

            $book_name = "Taking out the trash";
            $test_book = new Book($book_name);
            $test_book->save();
            //Act

            $test_book->addAuthor($test_author);
            $test_book->addAuthor($test_author2);
            //Assert

            $this->assertEquals($test_book->getAuthors(), [$test_author, $test_author2]);
        }

        function testDeleteMore()
        {
            //Arrange
            $name = "Frenchie";
            $test_author = new Author($name);
            $test_author->save();

            $book_name = "File reports";
            $test_book = new Book($book_name);
            $test_book->save();

            //Act
            $test_book->addAuthor($test_author);
            $test_book->delete();
            //Assert
            $this->assertEquals([], $test_book->getAuthors());
        }

    }

?>
