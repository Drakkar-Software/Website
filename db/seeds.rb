# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Article.destroy_all

Article.create!([{
                  title: 'OctoBot in Open Beta !',
                  author: 'Herklos',
                  description: 'OctoBot is now in open beta phase, you can now download this new release.',
                  published_at: DateTime.strptime('06/09/2018 20:00', '%d/%m/%Y %H:%M'),
                  link_text: 'Download open beta release',
                  link: 'https://github.com/Drakkar-Software/OctoBot/releases/tag/0.2.0-beta'
                },
                 {
                   title: 'OctoBot on telegram and discord',
                   author: 'GuillaumeDSM',
                   description: 'An OctoBot community has been created on telegram and discord.',
                   published_at: DateTime.strptime('06/01/2019 19:00', '%d/%m/%Y %H:%M'),
                   link_text: 'See community links',
                   link: 'https://github.com/Drakkar-Software/OctoBot'
                 },
                 {
                   title: 'OctoBot update 0.3.0 !',
                   author: 'Herklos',
                   description: 'Huge update with big features such as asynchronous core engine for better performances, improved user interface, new notification services and much more !.',
                   published_at: DateTime.strptime('27/01/2019 23:00', '%d/%m/%Y %H:%M'),
                   link_text: 'Download latest release',
                   link: 'https://github.com/Drakkar-Software/OctoBot-Launcher'
                 },
                 {
                     title: 'OctoBot update 0.3.3 !',
                     author: 'Herklos',
                     description: 'This version includes improvements on the web interface, the new community page, improved trading strategies and much more !.',
                     published_at: DateTime.strptime('19/04/2019 20:00', '%d/%m/%Y %H:%M'),
                     link_text: 'Download latest release',
                     link: 'https://github.com/Drakkar-Software/OctoBot-Launcher'
                 }])
