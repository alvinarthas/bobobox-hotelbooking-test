# bobobox-hotelbooking-test
## First Test for Backend Engineer Test in Bobobox

### DATABASE DESIGN:
![alt text](https://github.com/alvinarthas/bobobox-hotelbooking-test/blob/master/db/bobobox_hotel.png?raw=true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### DATABASE EXPLANATION
So, I redesign the database structure, from the given structure

#### Type & Hotel:
I design the type have relationship belongsTo Hotel, because sometimes every hotel got different type of room

#### Room & Type :
A Room, which like (Room 01, Room 02, Room 03) should need a type for declaring the facilities, size, max people and also total room the the Type have. Ex: Type A got (Room 01, Room 02, Room 03) have total of 3 room

#### Room Price:
Room Price is based on the Type, it means that Room 01 until Room 03 which have the same type room, got same price.
I design the roomprice dynamics, we can see that room price got field "start_date" and "end_date"
here, we can even set the price for a whole year, or even just for a day
example: Type A price is Rp 80.000 for 2020, but we can add another price (Rp 50.000) only for August. So if we search price in July, the result will be Rp 80.000, but if we search in August, the result will be Rp 50.000

#### Reservation and Stay
A Customer can reserve multiple rooms under different guest name, which in this case, A Customer can order more than One Hotel, because table "stays" can have more than one room (room->type->hotel) 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### SYSTEM EXPLANATION

#### Structure
This was made with Go with Gin Framework support by Gorm Framework for the SQL
The Database was automatically migrate with Gorm

#### How To Use
* Import the database from folder db
* Run the app in Go : "go run server.go"
* Open POSTMAN and import the API DOC from folder api
* Input the parameter ("check_in","check_out","guest")
* Send The API
* You Will receive the response

#### Search Function
* it will loop through all room type (it will check whether the guest can fit for the room type)
* while iterating, it will check if the room type price is available, if yes, it will process to the next logi
* the next logic will count how many room booked for the range of date (from check_in until check_out)
* the total room that we got from table types will minus with the amount of booked room
* last, it will response the collected data



