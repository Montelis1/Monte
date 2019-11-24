enum tInformacija
{
    bool:Uzraktas,
    bool:Sudauzyta,
    bool:Radijas,
    bool:Turgaus_Car,
   	bool:MasinaParduodama,
   	bool:KraunamAkumuliatoriu,
   	bool:SugedoCar,
    bool:Registruota,
    bool:Technikine,
    bool:HealthChange,
    bool:vOwned,
    bool:vKma,
    vTune[13],
	mParduodamaKaina,
    Savininkas[24],
    Float:Rida,
    DegaluTipas,
    Tranzitiniai[24],
    Raides[24],
    Skaiciai[24],
    Degalai,
    Color1,
    Color2,
    Paintjob,
    Turgus_Kaina,
    Text3D:mPardavimo3d,
    Akumuliatorius,
    Float:vHeal,
    Text3D:Turgaus3D,
    Busena
}
new tInfo [MAX_VEHICLES] [tInformacija];

new TransportoPavadinimai[212][] = {
        {"Landstalker"},
        {"Bravura"},
        {"Buffalo"},
        {"Linerunner"},
        {"Perrenial"},
        {"Sentinel"},
        {"Dumper"},
        {"Firetruck"},
        {"Trashmaster"},
        {"Stretch"},
        {"Manana"},
        {"Infernus"},
        {"Voodoo"},
        {"Pony"},
        {"Mule"},
        {"Cheetah"},
        {"Ambulance"},
        {"Leviathan"},
        {"Moonbeam"},
        {"Esperanto"},
        {"Taxi"},
        {"Washington"},
        {"Bobcat"},
        {"Mr Whoopee"},
        {"BF Injection"},
        {"Hunter"},
        {"Premier"},
        {"Enforcer"},
        {"Securicar"},
        {"Banshee"},
        {"Predator"},
        {"Bus"},
        {"Rhino"},
        {"Barracks"},
        {"Hotknife"},
        {"Trailer 1"},
        {"Previon"},
        {"Coach"},
        {"Cabbie"},
        {"Stallion"},
        {"Rumpo"},
        {"RC Bandit"},
        {"Romero"},
        {"Packer"},
        {"Monster"},
        {"Admiral"},
        {"Squalo"},
        {"Seasparrow"},
        {"Pizzaboy"},
        {"Tram"},
        {"Trailer 2"},
        {"Turismo"},
        {"Speeder"},
        {"Reefer"},
        {"Tropic"},
        {"Flatbed"},
        {"Yankee"},
        {"Caddy"},
        {"Solair"},
        {"Berkley's RC Van"},
        {"Skimmer"},
        {"PCJ-600"},
        {"Faggio"},
        {"Freeway"},
        {"RC Baron"},
        {"RC Raider"},
        {"Glendale"},
        {"Oceanic"},
        {"Sanchez"},
        {"Sparrow"},
        {"Patriot"},
        {"Quad"},
        {"Coastguard"},
        {"Dinghy"},
        {"Hermes"},
        {"Sabre"},
        {"Rustler"},
        {"ZR-350"},
        {"Walton"},
        {"Regina"},
        {"Comet"},
        {"BMX"},
        {"Burrito"},
        {"Camper"},
        {"Marquis"},
        {"Baggage"},
        {"Dozer"},
        {"Maverick"},
        {"News Chopper"},
        {"Rancher"},
        {"FBI Rancher"},
        {"Virgo"},
        {"Greenwood"},
        {"Jetmax"},
        {"Hotring"},
        {"Sandking"},
        {"Blista Compact"},
        {"PD Maverick"},
        {"Boxville"},
        {"Benson"},
        {"Mesa"},
        {"RC Goblin"},
        {"Hotring Racer A"},
        {"Hotring Racer B"},
        {"Bloodring Banger"},
        {"Rancher"},
        {"Super GT"},
        {"Elegant"},
        {"Journey"},
        {"Bike"},
        {"Mountain Bike"},
        {"Beagle"},
        {"Cropdust"},
        {"Stunt"},
        {"Tanker"},
        {"Roadtrain"},
        {"Nebula"},
        {"Majestic"},
        {"Buccaneer"},
        {"Shamal"},
        {"Hydra"},
        {"FCR-900"},
        {"NRG-500"},
        {"HPV1000"},
        {"Cement Truck"},
        {"Tow Truck"},
        {"Fortune"},
        {"Cadrona"},
        {"FBI Truck"},
        {"Willard"},
        {"Forklift"},
        {"Tractor"},
        {"Combine"},
        {"Feltzer"},
        {"Remington"},
        {"Slamvan"},
        {"Blade"},
        {"Freight"},
        {"Streak"},
        {"Vortex"},
        {"Vincent"},
        {"Bullet"},
        {"Clover"},
        {"Sadler"},
        {"Firetruck LA"},
        {"Hustler"},
        {"Intruder"},
        {"Primo"},
        {"Cargobob"},
        {"Tampa"},
        {"Sunrise"},
        {"Merit"},
        {"Utility"},
        {"Nevada"},
        {"Yosemite"},
        {"Windsor"},
        {"Monster A"},
        {"Monster B"},
        {"Uranus"},
        {"Jester"},
        {"Sultan"},
        {"Stratum"},
        {"Elegy"},
        {"Raindance"},
        {"RC Tiger"},
        {"Flash"},
        {"Tahoma"},
        {"Savanna"},
        {"Bandito"},
        {"Freight Flat"},
        {"Streak Carriage"},
        {"Kart"},
        {"Mower"},
        {"Duneride"},
        {"Sweeper"},
        {"Broadway"},
        {"Tornado"},
        {"AT-400"},
        {"DFT-30"},
        {"Huntley"},
        {"Stafford"},
        {"BF-400"},
        {"Newsvan"},
        {"Tug"},
        {"Trailer 3"},
        {"Emperor"},
        {"Wayfarer"},
        {"Euros"},
        {"Hotdog"},
        {"Club"},
        {"Freight Carriage"},
        {"Trailer 3"},
        {"Andromada"},
        {"Dodo"},
        {"RC Cam"},
        {"Launch"},
        {"LS PD"},
        {"SF PD"},
        {"LV PD"},
        {"PD Ranger"},
        {"Picador"},
        {"SWAT Van"},
        {"Alpha"},
        {"Phoenix"},
        {"Glendale"},
        {"Sadler"},
        {"Luggage Trailer A"},
        {"Luggage Trailer B"},
        {"Stair Trailer"},
        {"Boxville"},
        {"Farm Plow"},
        {"Utility Trailer"}
};
new DegaluBakai[212] = {
        85, // Landstalker.
        45, // Bravura.
        65, // Buffalo.
        140, // Linerunner.
        52, // Perrenial.
        67, // Sentinel.
        200, // Dumper.
        160, // Firetruck.
        120, // Trashmaster.
        80, // Stretch.
        40, // Manana.
        81, // Infernus.
        64, // Voodoo.
        76, // Pony.
        81, // Mule.
        67, // Cheetah.
        84, // Ambulance.
        50, // Leviathan.
        70, // Moonbeam.
        57, // Esperanto.
        49, // Taxi.
        69, // Washington.
        48, // Bobcat.
        66, // Mr Whoopee.
        31, // BF Injection.
        200, // Hunter.
        57, // Premier.
        90, // Enforcer.
        90, // Securicar.
        79, // Banshee.
        200, // Predator.
        150, // Bus.
        350, // Rhino.
        150, // Barracks.
        45, // Hotknife.
        0, // Trailer 1.
        53, // Previon.
        150, // Coach.
        49, // Cabbie.
        67, // Stallion.
        82, // Rumpo.
        0, // RC Bandit.
        59, // Romero.
        100, // Packer.
        100, // Monster.
        72, // Admiral.
        130, // Squalo.
        130, // Seasparrow.
        22, // Pizzaboy.
        0, // Tram.
        0, // Trailer 2.
        84, // Turismo.
        76, // Speeder.
        100, // Reefer.
        100, // Tropic.
        84, // Flatbed.
        79, // Yankee.
        20, // Caddy.
        51, // Solair.
        68, // Berkley's RC Van.
        100, // Skimmer.
        40, // PCJ-600.
        22, // Faggio.
        44, // Freeway.
        0, // RC Baron.
        0, // RC Raider.
        68, // Glendale.
        68, // Oceanic.
        40, // Sanchez.
        130, // Sparrow.
        70, // Patriot.
        50, // Quad.
        140, // Coastguard.
        101, // Dinghy.
        60, // Hermes.
        63, // Sabre.
        50, // Rustler.
        60, // ZR-350.
        58, // Walton.
        67, // Regina.
        67, // Comet.
        0, // BMX.
        71, // Burrito.
        84, // Camper.
        100, // Marquis.
        30, // Baggage.
        50, // Dozer.
        130, // Maverick.
        130, // News Chopper.
        87, // Rancher.
        90, // FBI Rancher.
        47, // Virgo.
        65, // Greenwood.
        135, // Jetmax.
        68, // Hotring.
        89, // Sandking.
        61, // Blista Compact.
        200, // Police Maverick.
        86, // Boxville.
        87, // Benson.
        69, // Mesa.
        0, // RC Goblin.
        68, // Hotring Racer A.
        68, // Hotring Racer B.
        68, // Bloodring Banger.
        87, // Rancher.
        63, // Super GT.
        68, // Elegant.
        78, // Journey.
        0, // Bike.
        0, // Mountain Bike.
        100, // Beagle.
        100, // Cropdust.
        100, // Stunt.
        145, // Tanker.
        90, // Roadtrain.
        66, // Nebula.
        72, // Majestic.
        56, // Buccaneer.
        500, // Shamal.
        500, // Hydra.
        54, // FCR-900.
        57, // NRG-500.
        56, // HPV1000.
        97, // Cement Truck.
        79, // Tow Truck.
        60, // Fortune.
        59, // Cadrona.
        70, // FBI Truck.
        63, // Willard.
        37, // Forklift.
        30, // Tractor.
        90, // Combine.
        60, // Feltzer.
        70, // Remington.
        62, // Slamvan.
        62, // Blade.
        0, // Freight.
        0, // Streak.
        40, // Vortex.
        57, // Vincent.
        75, // Bullet.
        64, // Clover.
        56, // Sadler.
        160, // Firetruck LA.
        47, // Hustler.
        58, // Intruder.
        65, // Primo.
        300, // Cargobob.
        65, // Tampa.
        59, // Sunrise.
        61, // Merit.
        72, // Utility.
        200, // Nevada.
        86, // Yosemite.
        68, // Windsor.
        100, // Monster A.
        100, // Monster B.
        68, // Uranus.
        73, // Jester.
        69, // Sultan.
        70, // Stratum.
        71, // Elegy.
        150, // Raindance.
        0, // RC Tiger.
        55, // Flash.
        65, // Tahoma.
        70, // Savanna.
        50, // Bandito.
        0, // Freight Flat.
        0, // Streak Carriage.
        20, // Kart.
        25, // Mower.
        94, // Duneride.
        35, // Sweeper.
        55, // Broadway.
        74, // Tornado.
        1000, // AT-400.
        105, // DFT-30.
        89, // Huntley.
        76, // Stafford.
        46, // BF-400.
        70, // Newsvan.
        30, // Tug.
        0, // Trailer 3.
        67, // Emperor.
        40, // Wayfarer.
        68, // Euros.
        84, // Hotdog.
        64, // Club.
        0, // Freight Carriage.
        0, // Trailer 3.
        1000, // Andromada.
        90, // Dodo.
        0, // RC Cam.
        170, // Launch.
        72, // LS Police Car.
        72, // SF Police Car.
        72, // LV Police Car.
        80, // Police Ranger.
        67, // Picador.
        182, // S.W.A.T. Van.
        62, // Alpha.
        71, // Phoenix.
        68, // Glendale.
        60, // Sadler.
        0, // Luggage Trailer A.
        0, // Luggage Trailer B.
        0, // Stair Trailer.
        86, // Boxville.
        0, // Farm Plow.
        0 // Utility Trailer.
};
new DegaluSanaudos[212] = {
        1, // Landstalker.
        1, // Bravura.
        1, // Buffalo.
        1, // Linerunner.
        1, // Perrenial.
        1, // Sentinel.
        1, // Dumper.
        1, // Firetruck.
        1, // Trashmaster.
        1, // Stretch.
        1, // Manana.
        1, // Infernus.
        1, // Voodoo.
        1, // Pony.
        1, // Mule.
        1, // Cheetah.
        1, // Ambulance.
        1, // Leviathan.
        1, // Moonbeam.
        1, // Esperanto.
        1, // Taxi.
        1, // Washington.
        1, // Bobcat.
        1, // Mr Whoopee.
        1, // BF Injection.
        1, // Hunter.
        1, // Premier.
        1, // Enforcer.
        1, // Securicar.
        1, // Banshee.
        1, // Predator.
        1, // Bus.
        1, // Rhino.
        1, // Barracks.
        1, // Hotknife.
        0, // Trailer 1.
        1, // Previon.
        1, // Coach.
        1, // Cabbie.
        1, // Stallion.
        1, // Rumpo.
        0, // RC Bandit.
        1, // Romero.
        1, // Packer.
        1, // Monster.
        1, // Admiral.
        1, // Squalo.
        1, // Seasparrow.
        1, // Pizzaboy.
        0, // Tram.
        0, // Trailer 2.
        1, // Turismo.
        1, // Speeder.
        1, // Reefer.
        1, // Tropic.
        1, // Flatbed.
        1, // Yankee.
        1, // Caddy.
        1, // Solair.
        1, // Berkley's RC Van.
        1, // Skimmer.
        1, // PCJ-600.
        1, // Faggio.
        1, // Freeway.
        0, // RC Baron.
        0, // RC Raider.
        1, // Glendale.
        1, // Oceanic.
        1, // Sanchez.
        1, // Sparrow.
        1, // Patriot.
        1, // Quad.
        1, // Coastguard.
        1, // Dinghy.
        1, // Hermes.
        1, // Sabre.
        1, // Rustler.
        1, // ZR-350.
        1, // Walton.
        1, // Regina.
        1, // Comet.
        0, // BMX.
        1, // Burrito.
        1, // Camper.
        1, // Marquis.
        1, // Baggage.
        1, // Dozer.
        1, // Maverick.
        1, // News Chopper.
        1, // Rancher.
        1, // FBI Rancher.
        1, // Virgo.
        1, // Greenwood.
        1, // Jetmax.
        1, // Hotring.
        1, // Sandking.
        1, // Blista Compact.
        1, // Police Maverick.
        1, // Boxville.
        1, // Benson.
        1, // Mesa.
        0, // RC Goblin.
        1, // Hotring Racer A.
        1, // Hotring Racer B.
        1, // Bloodring Banger.
        1, // Rancher.
        1, // Super GT.
        1, // Elegant.
        1, // Journey.
        0, // Bike.
        0, // Mountain Bike.
        1, // Beagle.
        1, // Cropdust.
        1, // Stunt.
        1, // Tanker.
        1, // Roadtrain.
        1, // Nebula.
        1, // Majestic.
        1, // Buccaneer.
        1, // Shamal.
        1, // Hydra.
        1, // FCR-900.
        1, // NRG-500.
        1, // HPV1000.
        1, // Cement Truck.
        1, // Tow Truck.
        1, // Fortune.
        1, // Cadrona.
        1, // FBI Truck.
        1, // Willard.
        1, // Forklift.
        1, // Tractor.
        1, // Combine.
        2, // Feltzer.
        1, // Remington.
        1, // Slamvan.
        1, // Blade.
        0, // Freight.
        0, // Streak.
        1, // Vortex.
        1, // Vincent.
        1, // Bullet.
        1, // Clover.
        1, // Sadler.
        1, // Firetruck LA.
        1, // Hustler.
        1, // Intruder.
        1, // Primo.
        1, // Cargobob.
        1, // Tampa.
        1, // Sunrise.
        1, // Merit.
        1, // Utility.
        1, // Nevada.
        1, // Yosemite.
        1, // Windsor.
        1, // Monster A.
        1, // Monster B.
        1, // Uranus.
        1, // Jester.
        1, // Sultan.
        1, // Stratum.
        1, // Elegy.
        1, // Raindance.
        0, // RC Tiger.
        1, // Flash.
        1, // Tahoma.
        1, // Savanna.
        1, // Bandito.
        0, // Freight Flat.
        0, // Streak Carriage.
        1, // Kart.
        1, // Mower.
        1, // Duneride.
        1, // Sweeper.
        1, // Broadway.
        1, // Tornado.
        1, // AT-400.
        1, // DFT-30.
        1, // Huntley.
        1, // Stafford.
        1, // BF-400.
        1, // Newsvan.
        1, // Tug.
        0, // Trailer 3.
        1, // Emperor.
        1, // Wayfarer.
        1, // Euros.
        1, // Hotdog.
        1, // Club.
        0, // Freight Carriage.
        0, // Trailer 3.
        1, // Andromada.
        1, // Dodo.
        0, // RC Cam.
        1, // Launch.
        1, // LS Police Car.
        1, // SF Police Car.
        1, // LV Police Car.
        1, // Police Ranger.
        1, // Picador.
        1, // S.W.A.T. Van.
        1, // Alpha.
        1, // Phoenix.
        1, // Glendale.
        1, // Sadler.
        0, // Luggage Trailer A.
        0, // Luggage Trailer B.
        0, // Stair Trailer.
        1, // Boxville.
        0, // Farm Plow.
        0 // Utility Trailer.
};
