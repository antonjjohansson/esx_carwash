# esx_carwash
esx_carwash is a simple car washing script, with customizable price, and you can add or remove any car wash!

[Installation]

1) Download the file on the github.
2) Unzip, and rename esx_carwash_master to esx_carwash and add into your resource folder.
3) Add "ensure esx_carwash" in your server.cfg file.
4) Have fun!

[Tutorial]

Changing the price of the carwash is in the config.lua file, just change the number from 150 to your desired price, in Config.CleaningPrice = 150.

To add more car washes, then I'd recommend opening the config.lua file and pasting
" {title="Jeffs Car Wash", colour=18, id=100, x = 20.35   ,y = -1391.82 ,z = 28.92 }, "
And change the xyz coords to your desired location. 
(If you don't know how to check coords for your posistion add this code at the end of the client/main.lua file)
"
-- Display Coords in console
RegisterCommand('coords', function()
	print(GetEntityCoords(PlayerPedId()))
end)
"
Then restart your script, and when doing /coords in chat, it will print the exact vector3 coordinates in your F8 console.

Changing the title on the car washes is also your option, the original is "Jeffs Car Wash" but feel free to change all the blip names to your desired name!

[Disclaimer]
To edit and publish my script you are needed to credit me.
For any questions, feel free to send them here on github.
Feel free to improve my script if you'd like.

