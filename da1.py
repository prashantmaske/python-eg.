TryAgain = True
while TryAgain:
	try:
		Value = int(input("Type a whole number "))
	except ValueError:
		print("You must type a whole number!")
		try:
			DoOver = int(input("Try again \n press any no. to continue \n press 2 to exit ? "))
		except:
			print("u gave wrong input \n OK, see you next time!")
			TryAgain = False
		else:
			if (DoOver == 2):
				print('you exited \n please fuck off')
				TryAgain = False
	except KeyboardInterrupt:
		print("You pressed Ctrl+C!")
		print("See you next time!")
		TryAgain = False
	else:
		print('you typed ',Value)
		TryAgain = False
