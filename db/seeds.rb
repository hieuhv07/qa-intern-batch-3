User.create!(username: "admin",
						fullname: "Bot Admin",
						email: "admin@gmail.com",
						password: "11111111",
						password_confirmation: "11111111",
						role: 1,
						activated: true,
						activated_at: Time.zone.now)