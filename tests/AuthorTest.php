<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Author.php";
    require_once "src/Book.php";

    $DB = new PDO('pgsql:host=localhost;dbname=library_test');

    class AuthorTest extends PHPUnit_Framework_TestCase
    {
        protected function tearDown()
        {
            Author::deleteAll();
            Book::deleteAll();
        }

        function test_GetName()
        {
            //Arrange
            $name = "Walt Whitman";
            $test_author = new Author($name);

            //Act
            $result = $test_author->getName();

            //Assert
            $this->assertEquals($name, $result);
        }

        function test_SetName()
        {
            //Arrange
            $name = "Dandy";
            $test_author = new Author($name);
            $new_name = "Terry";

            //Act
            $test_author->setName($new_name);
            $result = $test_author->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_GetId()
        {
            //Arrange
            $name = "Frank";
            $id = 1;
            $test_author = new Author($name, $id);

            //Act
            $result = $test_author->getId();

            //Assert
            $this->assertEquals($id, $result);
        }

        function test_SetId()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_author = new Author($name, $id);
            $new_id = 2;

            //Act
            $test_author->setId($new_id);
            $result = $test_author->getId();

            //Assert
            $this->assertEquals($new_id, $result);
        }

        function test_save()
        {
            //Arrange
            $name = "Hemmingway";
            $test_author = new Author($name);

            //Act
            $test_author->save();
            $result = Author::getAll();

            //Assert
            $this->assertEquals($test_author, $result[0]);

        }

        function test_getAll()
        {
            //Arrange
            $name = "Bogus";
            $test_author = new Author($name);
            $test_author->save();

            $name2 = "Wendy";
            $test_author2 = new Author($name2);
            $test_author2->save();

            //Act
            $result = Author::getAll();

            //Assert
            $this->assertEquals([$test_author, $test_author2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "Freddy";
            $test_author = new Author($name);
            $test_author->save();

            //Act
            Author::deleteAll();
            $result = Author::getAll();

            //Assert
            $this->assertEquals([], $result);
        }

        function test_find()
        {
            //Arrange
            $name = "Tommy";
            $test_author = new Author($name);
            $test_author->save();

            $name2 = "Connor";
            $test_author2 = new Author($name2);
            $test_author2->save();

            //Act
            $result = Author::find($test_author2->getId());

            //Assert
            $this->assertEquals($test_author2, $result);
        }

        function test_update()
        {
            //Arrange
            $name = "asdfasdf";
            $test_author = new Author($name);
            $test_author->save();

            $new_name = "Poppy";

            //Act
            $test_author->update($new_name);

            //Assert
            $this->assertEquals($new_name, $test_author->getName());

        }

        function test_delete()
        {
            //Arrange
            $name = "Zed";
            $test_author = new Author($name);
            $test_author->save();

            $name2 = "Fred";
            $test_author2 = new Author($name2);
            $test_author2->save();

            //Act
            $test_author2->delete();
            $result = Author::getAll();

            //Assert
            $this->assertEquals([$test_author], $result);
        }

        function testAddBook()
        {
            //Arrange
            $name = "Tim";
            $test_author = new Author($name);
            $test_author->save();

            $book_name = "PHP";
            $test_book = new Book($book_name);
            $test_book->save();

            //Act
            $test_author->addBook($test_book);
            $result = $test_author->getBooks();

            //Assert
            $this->assertEquals([$test_book], $result);
        }

        function testGetBooks()
        {
            //Arrange
            $name = "Debra Burnheart";
            $test_author = new Author($name);
            $test_author->save();

            $book_name = "How to wash the dog";
            $test_book = new Book($book_name);
            $test_book->save();

            $book_name2 = "Taking out the trash";
            $test_book2 = new Book($book_name2);
            $test_book2->save();
            //Act

            $test_author->addBook($test_book);
            $test_author->addBook($test_book2);
            //Assert

            $this->assertEquals($test_author->getBooks(), [$test_book, $test_book2]);
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
            $test_author->addBook($test_book);
            $test_author->delete();
            //Assert
            $this->assertEquals([], $test_book->getAuthors());


        }
    }

?>
