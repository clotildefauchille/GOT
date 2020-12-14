BEGIN;

DROP TABLE IF EXISTS "family_has_member", "member", "banneret", "family", "kingdom", "continent";

CREATE TABLE "continent" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"image" TEXT NOT NULL
);

CREATE TABLE "kingdom" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"image" TEXT NOT NULL,
	"continent_id" INT NOT NULL REFERENCES "continent"("id")
);

CREATE TABLE "family" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"image" TEXT NOT NULL,
	"kingdom_id" INT NOT NULL REFERENCES "kingdom"("id")
);

CREATE TABLE "banneret" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"family_id" INT NOT NULL REFERENCES "family"("id")
);

CREATE TABLE "member" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "family_has_member" (
	"family_id" INT NOT NULL REFERENCES "family"("id"),
	"member_id" INT NOT NULL REFERENCES "member"("id"),
	PRIMARY KEY ("family_id", "member_id")
);

INSERT INTO "continent" ("name", "image") VALUES
('Essos', 'essos.jpg'),
('Westeros', 'westeros.jpg');

INSERT INTO "kingdom" ("name", "description", "image", "continent_id") VALUES
('Nord', 'Le Nord de Westeros constitue la moitié septentrionale du continent dont il est aussi la région la plus froide. Le Nord est à lui seul aussi vaste que les six autres Royaumes réunis, mais il est bien moins peuplé. Le climat y est froid, la neige fréquente et les hivers particulièrement rudes. Elle est le domaine de la maison Stark de Winterfell dont la devise est précisément « L''hiver approche ». Les bâtards y sont nommés « Snow ».', 'nord.jpg', 2),
('Conflans', 'Le Conflans, domaine de la maison Tully de Vivesaigues, est une région de Westeros bordée par le Neck au nord, par le Val d''Arryn et les Terres de la Couronne à l''est, et par le Bief et les Terres de l''Ouest au sud et à l''ouest. C''est une région densément peuplée et fertile, traversée par de nombreux cours d''eau. Les bâtards y sont nommés « Rivers ».', 'conflans.jpg', 2),
('Val d''Arryn', 'Le Val d''Arryn est une région montagneuse bordée par le Conflans à l''ouest et les Terres de la Couronne au sud. Le Val en lui-même entoure presque entièrement les montagnes de la Lune, situées à l''est de Westeros. C''est le domaine de la maison Arryn, l''une des plus anciennes famille noble descendante des Andals, et, avant la conquête d''Aegon Targaryen, rois des Montagnes et du Val. Sa capitale, les Eyriés, est un petit château réputé insaisissable. Les bâtards y sont nommés « Stone ».', 'valArryn.jpg', 2),
('Iles de Fer', 'Les Îles de Fer, domaine de la maison Greyjoy, sont un archipel de sept îles situées au large du Conflans, sur la côte ouest de Westeros. Elles doivent leur nom à la présence de nombreuses mines de fer. Ces îles ont un sol pauvre et rocailleux et leurs habitants, les « Fers-nés », vivent principalement de la pêche et du pillage de terres plus fertiles. Les îles sont nommées Pyk, Grand Wyk, Vieux Wyk, Harloi, Salfalaise, Noirmarées et Orkmont. Les bâtards y sont nommés « Pyke ».', 'ilesFer.jpg', 2),
('Terres de la Couronne' ,'Les Terres de la Couronne, fief ancestral de la maison Targaryen, sont bordées par le Val d''Arryn au nord, le Conflans à l''ouest, et les Terres de l''Orage au sud. Les rois Targaryen, après leur conquête des Sept Couronnes, en ont fait l''une des neuf régions de Westeros et en y établissant leur capitale à Port-Réal. Les Terres de la Couronne sont formées par les côtes littorales de la baie de la Néra, ainsi que l''île de Peyredragon, la patrie des Targaryen située à l''entrée de la baie. Port-Réal est devenue la plus grande ville de Westeros. Les bâtards y sont nommés « Waters ».', 'terresCouronne.jpg', 2),
('Terres de l''Ouest', 'Les Terres de l''Ouest, domaine de la maison Lannister, sont bordées par le Conflans à l''est et par le Bief au sud. Ce sont des terres montagneuses riches en minerais et notamment en gisements d''or, source principale de la richesse des Lannister. Les bâtards y sont nommés « Hill ».', 'terresOuest.jpg', 2),
('Terres de l''Orage', 'Les Terres de l''Orage, domaine de la maison Baratheon, sont bordées par les Terres de la Couronne au nord, le Bief à l''ouest, et Dorne au sud. Elle est bordée par la baie des Naufrageurs à l''est et par la mer de Dorne au sud. La région comporte de nombreuses terres boisées ou montagneuses. Les bâtards y sont nommés « Storm ».', 'terresOrage.jpg', 2),
('Bief', 'Le Bief, domaine de la maison Tyrell, est la région au sud-ouest de Westeros. La région est couverte de plaines agricoles très fertiles. Sa prospérité et sa puissance sont principalement issues du commerce de nourriture et de vin; en temps de guerre, leur abondance met les habitants du Bief à l''abri de la famine et de la maladie. Les vassaux des Tyrell ont régulièrement été opposés aux Dorniens, au sud. La frontière entre le Bief et Dorne est appelée les Marches de Dorne, contrôlées par les seigneurs de l''Orage. La Citadelle des mestres est située à Villevieille, sur la côte sud. Les bâtards y sont nommés « Flowers ».', 'bief.jpg', 2),
('Dorne', 'La péninsule de Dorne, domaine de la maison Martell, se situe au sud-est de Westeros, dont elle constitue la partie la moins peuplée. Les parties frontalières avec le Bief et les Terres de l''Orage sont montagneuses et toutes les autres sont désertiques, avec un climat aride et sec. Des rivières offrent cependant assez de terres fertiles à cultiver; l''eau y est précieuse mais elle y est suffisamment abondante pour permettre de supporter les longs étés chauds. Dorne est bordée au nord par la mer de Dorne, par les îles des Degrés de Pierre à l''est et à l''ouest par les montagnes rouges précédant les Marches de Dorne; la côte sud s''étend le long de la mer d''Été. Les bâtards y sont nommés « Sand ».', 'dorne.jpg', 2),
('Braavos', 'Braavos est la cité libre située la plus au nord et la plus proche de Westeros; elle est devenue la plus puissante des Cités libres. Elle n''est pas une colonie valyrienne, mais un refuge à son expansion. La lagune abritant la ville a été découverte par des esclaves dissidents ayant fui le joug des Possessions valyriennes, aidés par des prêtresses nommées Chantelunes, venues des lointaines et orientales Plaines des Jogos Nhai. En reconnaissance, les nouveaux Braaviens leur construisirent un temple : le temples des Chantelunes, l''un des plus grands de la ville. La nouvelle ville se développa secrètement, le brouillard enveloppant fréquemment la lagune la dissimulant des dragons montés de Valyria, et abolit immédiatement après sa fondation la pratique que les Valyriens ont hérité de l''ancien Empire Ghiscari : l''esclavage.', 'braavos.jpg', 1),
('Pentos', 'Pentos est un port de commerce majeur situé dans une baie de la côte occidentale. Dominé par une architecture de tours carrées en briques, il est dirigé par un Prince choisi par les dirigeants de la ville, des marchands appelés magistrats. Les Khalasars dothrakis s''approchent régulièrement de la cité mais les Pentoshis ont réussi à éviter la plupart des invasions en leur payant des tributs.', 'pentos.jpg', 1),
('Volantis', 'Volantis est la plus ancienne des Cités libres. Elle est située au sud-ouest d''Essos, près de la Baie des serfs. Elle vit principalement du commerce d''esclaves, de verrerie et du vin, et est dirigée par un triumvirat élu. Les mercenaires volantains sont reconnaissables à leurs visages tatoués.', 'volantis.jpg', 1),
('Lorath', 'Lorath est une ville insulaire située au nord du continent. Jaqen H''ghar prétend en être originaire.', 'lorath.jpg', 1),
('Lys', 'Lys s''étend sur un archipel au sud d''Essos. Elle est renommée pour son luxe et ses mœurs libertines, abritant de nombreux bordels dont les esclaves sont entraînées aux arts de l''amour et vendues comme concubines. Lys est régulièrement en conflit avec Tyrosh et Myr pour le contrôle des Degrés de Pierre et des Terres Disputées. Les Lysiens ont pour la plupart les yeux bleus et les cheveux blonds. La ville abrite aussi une guilde d''alchimistes à l''origine d''un poison appelé les Larmes de Lys.', 'lys.jpg', 1),
('Myr', 'Myr est une cité côtière renommée pour son artisanat, notamment en matière de textiles (dentelle et tapis) et de verrerie (lentilles). Les Myriens sont des hommes à la peau et aux yeux foncés. Comme à Pentos, la ville est régie par des magistrats et elle paye un tribut aux Dothrakis de passage. Myr est un carrefour pour le commerce d''esclaves et est célèbre pour son vin de couleur vert pâle. Elle lutte souvent contre Tyrosh et Lys pour les Terres Disputées.', 'myr.jpg', 1),
('Norvos', 'Norvos, construite à l''intérieur du continent à l''est de Pentos, est divisée en deux parties : la ville haute qui se tient au sommet d''une haute colline, et la partie basse, le long de la Noyne, un affluent de la Rhoyne. Elle est entourée de collines et de fermes en terrasses. Norvos est une cité marchande dont les caravanes parcourent le continent, et, comme de nombreuses cités, elle préfère payer un tribut aux Dothrakis que subir leur courroux. C''est également une théocratie dominée par le culte des Prêtres barbus, un groupe de soldats d''élite maniant la hache de guerre.', 'norvos.jpg', 1),
('Qohor', 'Qohor est située à l''intérieur des terres, dans l''immense forêt de Qohor. Elle est réputée pour ses tapisseries et ses forges, dont les forgerons sont les seuls à pouvoir reforger l''acier valyrien. Le guet de la ville est composé par des Immaculés depuis que 3 000 d''entre eux défendirent la cité contre 25 000 Dothrakis pendant la bataille des Trois Mille. Depuis, ils accrochent à leurs lances des cheveux humains pour commémorer le fait que les Dothrakis ont coupé les leurs, saluant leur résistance.', 'qohor.jpg', 1),
('Tyrosh', 'Tyrosh, une ville côtière régie par un archonte, est tristement célèbre pour son avarice. Elle fait le commerce d''esclaves, de brandy à la poire et d''armures aux intrications compliquées, et elle regorge de mercenaires. Tyrosh abrite de nombreux bordels, bien qu''ils soient moins renommés que ceux de Lys. Avec Lys et Myr, Tyrosh est en conflit pour contrôler les Degrés de Pierre et des Terres Disputées. Les Tyroshis, comme les habitants de Pentos, portent des barbes et des moustaches, qu''ils taillent en pointe et teignent avec des couleurs vives.', 'tyrosh', 1);

INSERT INTO "family" ("name", "description", "image", "kingdom_id") VALUES
('Maison Arryn', 'La maison Arryn est l''une des grandes maisons des Sept Couronnes et gouverne la région du Val (The Vale). Elle descend des rois de la Montagne et du Val (Kings of Mountain and Vale) et a son siège à la forteresse des Eyrié (The Eyrie), un petit château situé au sommet d''une montagne. Les chefs de la maison Arryn sont gouverneurs de l''Est (Warden of the East) depuis la fondation des Sept-Couronnes. Son blason est un faucon blanc sur ciel de lune blanche, et sa devise est « Aussi haute qu''honneur » (« As High as Honor »). Les bâtards nés au Val sont nommés « Stone ».', 'arryn.png', 3),
('Maison Baratheon', 'La maison Baratheon est la plus récente des Grandes maisons des Sept Couronnes, et gouverne la région des Terres de l''Orage (The Stormlands). Fondée par le frère bâtard du premier roi Targaryen, Orys Baratheon, son siège se situe à Accalmie (Storm''s End) que gère Renly Baratheon, alors que sa branche royale est à la capitale Port-Réal (King''s Landing) avec Robert Baratheon, et la branche cadette de Stannis Baratheon se tient aussi à Peyredragon (Dragonstone). Son blason est un cerf noir sur champ doré, et sa devise est « Nôtre est la fureur » (« Ours is the Fury »). Les bâtards nés dans les terres de l''Orage sont nommés « Storm ». Le blason et la devise des Baratheon dérivent de ceux de la défunte maison Durrandon, la lignée royale des « Rois de l''Orage » qui régnaient sur les Terres de l''Orage jusqu''à l''arrivée des Targaryen, dont Orys Baratheon qui tua le dernier Roi de l''Orage et épousa sa fille, faisant du blason et de la devise des Durrandon ses propriétés.', 'baratheon.png', 7),
('Maison Greyjoy', 'La maison Greyjoy est l''une des grandes familles de Westeros et la suzeraine des Îles de Fer (The Iron Islands) et a son siège à Pyk (Pyke). Son blason est un kraken doré sur champ noir et sa devise est « Nous ne semons pas » (« We Do Not Sow »). Les Greyjoy devinrent les Seigneurs protecteurs des Îles de Fer (Lords Paramount of the Iron Islands) après que la maison Targaryen a conquis les Sept Couronnes et permis aux Fer-nés (Ironborn) de choisir leur dirigeant. Les Greyjoy sont réputés pour la puissance de leur flotte, et ils ont souvent conduits des raids contre d''autres maisons majeures, dans un but de pillage. Les bâtards nés dans les Îles de Fer sont nommés « Pyke ».', 'greyjoy.png', 4),
('Maison Lannister', 'La maison Lannister est la maison suzeraine des Terres de l''Ouest et a son siège à Castral Roc. Son blason est un lion d''or rugissant sur champ rouge et sa devise est « Je rugis » (« Hear Me Roar ») bien que la devise officieuse des Lannister soit « Un Lannister paie toujours ses dettes ». Les chefs de la maison Lannister sont gouverneurs de l''Ouest (Warden of the West) depuis la fondation des Sept-Couronnes. C''est la maison la plus riche des Sept Couronnes car elle contrôle de nombreuses mines d''or. Les Lannister sont généralement blonds aux yeux verts, un aspect courant parmi les membres de la maison, notamment les enfants de la branche aînée de la maison.', 'lannister.png', 6),
('Maison Martell', 'La maison Martell est la maison suzeraine de la péninsule de Dorne et a son siège à Lancehélion. Son blason est un soleil rouge traversé d''une lance dorée sur champ orange et sa devise est « Insoumis, invaincus, intacts » (« Unbowed, Unbent, Unbroken »). Les bâtards nés à Dorne sont nommés « Sand ». Le peuple de Dorne, les Dorniens, est issu d''un métissage entre les Andals qui habitaient le territoire avant la Conquête et le peuple Rhoynar, venant d''Essos et fuyant l''expansion de Valyria, Andals et Rhoynar se mélangèrent et le peuple Dornien garda plusieurs des coutumes des Rhoynars, notamment le fait que la succession ne se fait pas par primogéniture mâle, c''est-à-dire que le plus proche parent, fils ou fille, hérite du parent décédé. Contrairement aux autres provinces du Royaume des Sept Couronnes, Dorne est considérée comme une Principauté, et son seigneur n''est pas un Seigneur Suzerain mais un Prince ou une Princesse.', 'martell.png', 9),
('Maison Stark', 'La maison Stark est la maison suzeraine du Nord et son siège se situe à Winterfell. Leur blason est un « loup-garou » gris sur champ blanc, et leur devise est « L''hiver vient » (« Winter is Coming »). Les Stark descendent de Bran le Bâtisseur qui, selon la légende, a bâti Winterfell et le Mur avec l''aide des enfants de la forêt, un peuple disparu adepte de la magie. Puisque Bran est censé avoir vécu il y a 8 000 ans, cela fait des Stark l''une des plus vieilles familles de Westeros. Ils ont été rois du Nord pendant presque toute cette période, jusqu''à ce que le dernier roi Torrhen se soumette à Aegon le Conquérant. Les chefs de la maison Stark sont gouverneurs du Nord (Warden of the North) depuis. Comme la plupart des Maisons du Nord, à l''exception des Manderly, les Stark descendent d''une lignée préservée des Premiers Hommes. Comme pour les autres familles nobles du Nord, les batârds issus de la famille Stark sont nommés « Snow ».', 'stark.png', 1),
('Maison Targaryen', 'La maison Targaryen est une famille descendante du puissant empire de Valyria, à Essos, ayant conquis les Sept Couronnes avec trois gigantesques dragons, montés par Aegon le Conquérant et ses deux sœurs, Rhaennys et Visenya. S''ensuivirent presque trois siècles de règne de la dynastie Targaryen à Port-Réal, qui s''achevèrent lorsque Robert Baratheon détrôna Aerys II le Dément. Son blason est un dragon tricéphale rouge sur champ noir et sa devise est « Feu et Sang » (« Fire and Blood »).', 'targaryen.png', 5),
('Maison Tully', 'La maison Tully est la maison suzeraine de la région du Conflans et a son siège à Vivesaigues. Son blason est une truite argentée sur champ bleu et rouge et sa devise est « Famille, Devoir, Honneur » (« Family, Duty, Honor »).', 'tully.png', 2),
('Maison Tyrell', 'La maison Tyrell est l''une des grandes maisons des Sept Couronnes et la maison suzeraine de la région du Bief (Reach). Elle a son siège à Hautjardin (Highgarden). Son blason est une rose d''or sur champ vert et sa devise est « Plus haut, plus fort » (« Growing Strong »). Les Tyrell devinrent les seigneurs du Bief après que le roi du Bief fut tué et que la maison royale des Targaryen eut établi les Tyrell, alors intendants du roi du Bief, seigneurs de Hautjardin. Leur arrivée au pouvoir est cependant contestée par plusieurs maisons plus puissantes, notamment la maison Florent. Les chefs de la maison Tyrell sont gouverneurs du Sud (Warden of the South) depuis. Les femmes de la maison Tyrell sont réputées pour être des leaders perspicaces et habiles. Les bâtards nés dans le Bief sont appelés « Flowers ».', 'tyrell.png', 8);

INSERT INTO "member" ("name") VALUES
('John Arryn'),
('Lysa Tully ep. John Arryn'),
('Robert Arryn'),
('Robert Baratheon'),
('Cersei Lannister ep. Robert Baratheon'),
('Stannis Baratheon'),
('Renly Baratheon'),
('Joffrey Baratheon'),
('Margaery Tyrell ep. Joffrey Baratheon'),
('Myrcella Baratheon'),
('Tommen Baratheon'),
('Balon Greyjoy'),
('Euron Greyjoy'),
('Theon Greyjoy'),
('Asha Greyjoy'),
('Tywin Lannister'),
('Kevan Lannister'),
('Jaime Lannister'),
('Tyrion Lannister'),
('Sansa Stark ep. Tyrion Lannister'),
('Doran Martell'),
('Oberyn Martell'),
('Ellaria Sand conc. Oberyn Martell'),
('Elia Martell ep. Rhaegar Targaryen'),
('Arianne Martell'),
('Eddard Stark'),
('Catelyn Tully ep. Eddard Stark'),
('Lyanna Stark ep. Rhaegar Targaryen'),
('Robb Stark'),
('Arya Stark'),
('Bran Stark'),
('Rickon Stark'),
('Aery II Targaryen'),
('Rhaegar Targaryen'),
('Viseris Targaryen'),
('Daenerys Targaryen'),
('John Snow/Targaryen'),
('Hoster Tully'),
('Brynden Tully'),
('Edmure Tully'),
('Olenna Tyrell'),
('Mace Tyrell'),
('Loras Tyrell');


INSERT INTO "family_has_member" ("family_id", "member_id") VALUES
(1,1),
(1,2),
(8,2),
(1,3),
(2,4),
(2,5),
(4,5),
(2,6),
(2,7),
(2,8),
(2,9),
(9,9),
(2,10),
(2,11),
(3,12),
(3,13),
(3,14),
(3,15),
(4,16),
(4,17),
(4,18),
(4,19),
(4,20),
(6,20),
(5,21),
(5,22),
(5,23),
(5,24),
(7,24),
(5,25),
(6,26),
(6,27),
(8,27),
(6,28),
(7,28),
(6,29),
(6,30),
(6,31),
(6,32),
(7,33),
(7,34),
(7,35),
(7,36),
(7,37),
(6,37),
(8,38),
(8,39),
(8,40),
(9,41),
(9,42),
(9,43);



INSERT INTO "banneret" ("name", "family_id") VALUES
('Maison Baelish', 1),
('Maison Belmore', 1),
('Maison Corbray', 1),
('Maison Grafton', 1),
('Maison Rougefort', 1),
('Maison Royce', 1),
('Maison Sunderland', 1),
('Maison Vanbois', 1),
('Maison Veneur', 1),
('Maison Buckler', 2),
('Maison Caron', 2),
('Maison Dondarrion', 2),
('Maison Estremont', 2),
('Maison Connington', 2),
('Maison Mervault', 2),
('Maison Morrigen', 2),
('Maison Selmy', 2),
('Maison Staedmon', 2),
('Maison Swann', 2),
('Maison Torth', 2),
('Maison Bonfrère', 3),
('Maison Botley', 3),
('Maison Harloi', 3),
('Maison Timbal', 3),
('Maison Wynch', 3),
('Maison Brax', 4),
('Maison Clegane', 4),
('Maison Crakehall', 4),
('Maison Farman', 4),
('Maison Lefford', 4),
('Maison Marpheux', 4),
('Maison Payne', 4),
('Maison Prestre', 4),
('Maison Serrett', 4),
('Maison Boisleau', 5),
('Maison Dayne', 5),
('Maison Ferboys', 5),
('Maison Gargalen', 5),
('Maison Jordayne', 5),
('Maison Poulet', 5),
('Maison Uller', 5),
('Maison Bolton', 6),
('Maison Cassel', 6),
('Maison Cerwyn', 6),
('Maison Corbois', 6),
('Maison Flint', 6),
('Maison Karstark', 6),
('Maison Manderly', 6),
('Maison Mormont', 6),
('Maison Omble', 6),
('Maison Reed', 6),
('Maison Bracken', 8),
('Maison Darry', 8),
('Maison Frey', 8),
('Maison Mallister', 8),
('Maison Nerbosc', 8),
('Maison Piper', 8),
('Maison Vance', 8),
('Maison Ambrose', 9),
('Maison Caswell', 9),
('Maison Florent', 9),
('Maison Hightower', 9),
('Maison Redwyne', 9),
('Maison du Rouvre', 9),
('Maison Rowan', 9),
('Maison Tarly', 9);

COMMIT;

