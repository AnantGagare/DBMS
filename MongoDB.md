/* Mongo DB */



show dbs;
admin    0.000GB
config   0.000GB
local    0.000GB
product  0.000GB   // Create the New DB
student  0.000GB
sy87     0.000GB
syb      0.000GB

> use product;
switched to db product
> db.product.find().pretty();
{ "_id" : ObjectId("6461fe5015af1efa27388e91"), "pprice" : 30000 }
{
	"_id" : ObjectId("6461ff4115af1efa27388e92"),
	"pid" : 2,
	"pname" : {
		"fname" : "iphone",
		"lname" : "14s"
	},
	"pprice" : 20000,
	"pcolour" : [
		"blue",
		"black",
		"green"
	],
	"pquantity" : 10
}
{
	"_id" : ObjectId("6462052515af1efa27388e94"),
	"pid" : 1,
	"pname" : "nokia",
	"pprice" : 29000,
	"pcolour" : "red",
	"pquantity" : 100
}
{
	"_id" : ObjectId("64620a2515af1efa27388e95"),
	"pid" : 3,
	"pname" : "nokia",
	"pprice" : 9000,
	"pcolour" : "blue",
	"pquantity" : 19
}
{
	"_id" : ObjectId("6476c601d43dde83cec6794a"),
	"Name" : "MObile",
	"Brand" : "Iphone",
	"cost" : "35000",
	"stock_in" : "43"
}
{
	"_id" : ObjectId("6476cb16d43dde83cec6794b"),
	"Name" : {
		"First" : "Apple",
		"Middle" : "iphone",
		"Last" : "2s"
	}
}
{
	"_id" : ObjectId("6476ccbbd43dde83cec6794c"),
	"Pid" : 101,
	"Pname" : "Nokia",
	"Price" : "$20000",
	"Pquantity" : 50
}
{
	"_id" : ObjectId("6476cdb2d43dde83cec6794d"),
	"Pid" : 102,
	"Pname" : {
		"first" : "iphone",
		"Middle" : "pro",
		"Last" : "12s"
	},
	"Pcolor" : [
		"Blue",
		"Red",
		"Green"
	],
	"Price" : 55000
}
> 


