# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Article.destroy_all

Article.create!([{
                  title: 'OctoBot in Open Beta !',
                  author: 'Herklos',
                  description: 'OctoBot is now in open beta phase, you can now download this new release.',
                  published_at: DateTime.strptime('06/09/2018 20:00', '%m/%d/%Y %H:%M'),
                  link_text: "Download open beta release",
                  link: "https://github.com/Drakkar-Software/OctoBot/releases/tag/0.2.0-beta"
                }])
