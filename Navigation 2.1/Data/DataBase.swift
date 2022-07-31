//
//  DataBase.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 07.07.2022.
//

import Foundation

let billy = Post(
    author: "Billy Butcher",
    description: "A former member of the British special forces turned vigilante, Billy Butcher is as charming as he is cunning. He's a force of nature, who can talk almost anyone into anything, either through a smile or brute force – or sometimes both. He's consumed by one mission in life: to destroy superheroes. But this personal vendetta is driven by his hatred for one Supe in particular: Homelander. Butcher's determined to get revenge on Homelander, no matter the cost, and he won't let anyone or anything stand in his way.",
    image: "Billy_Butcher",
    likes: Int.random(in: 0..<5000),
    views: Int.random(in: 5000..<10000)
)

let hughie = Post(
    author: "Hughie Campbell",
    description: "Hughie has a mediocre life. He’s a mild-mannered guy with a boring job, who still lives at home with his Dad in the same bedroom he grew up in. The only light in his life is the love of his life: his girlfriend Robin. That is, until a speedster superhero named A-Train runs through Robin, eviscerating and killing her on impact. Desperate for revenge, Hughie is recruited by anti-Supe vigilante Billy Butcher and his world is turned upside down when he finds himself caught in the middle of a war against superheroes – who, as it turns out, are neither super nor heroic.",
    image: "Hughie_Campbell",
    likes: Int.random(in: 0..<5000),
    views: Int.random(in: 5000..<10000)
)

let star = Post(
    author: "Starlight",
    description: "Annie January is as down-to-earth and sincere as they come, the girl next door with superpowers. And as Starlight, 'The Defender of Des Moines', all she's ever wanted to do is save the world — and while a lot of people say that as a corny catchphrase, she actually means it. So, when she's selected to join The Seven, it's every dream she's ever had come true.",
    image: "Starlight",
    likes: Int.random(in: 0..<5000),
    views: Int.random(in: 5000..<10000)
)

let soldier = Post(
    author: "Soldier Boy",
    description: "As a young man, Soldier Boy supposedly helped good triumph over evil in World War II though he was actually a propaganda film actor who showed up for publicity shoots with American soldiers. With his superhero team Payback by his side, he claimed to fight for liberty and justice for all but relentlessly bullied his teammates until his disappearance during a botched military operation in Nicaragua, with the cover story being that he heroically sacrificed his own life to save America from a nuclear power plant meltdown in 1984",
    image: "Soldier_Boy",
    likes: Int.random(in: 0..<5000),
    views: Int.random(in: 5000..<10000)
)

let deep = Post(
    author: "The Deep",
    description: "After defecting from the Church of the Collective, The Deep has become a favorite on the national talk show circuit with the success of his (ghost-written) memoir, Deeper, about his escape from the cult. And with his brilliant wife, Cassandra, coaching him along, he’s finally getting the recognition he thinks he deserves. But none of that compares to being a hero in The Seven. And he wants back in. Bad.",
    image: "The Deep",
    likes: Int.random(in: 0..<5000),
    views: Int.random(in: 5000..<10000)
)

let dataBase:[Post] = [billy, hughie, star, soldier, deep]

