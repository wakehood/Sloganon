//
//  PhraseData.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//


func initSlogan(slogan: String) -> Phrase {
    Phrase(name: slogan, sayingType: K.sayingTypeSlogan)
}

func initSaying(saying: String) -> Phrase {
    Phrase(name: saying, sayingType: K.sayingTypeSaying)
}

func initAcronym(acronym: String) -> Phrase {
    Phrase(name: acronym, sayingType: K.sayingTypeAcronym)
}

func initSlogans() -> [Phrase] {
    let slogans: [String] = [
        "But for the Grace of God ",
        "Easy Does It ",
        "First Things First ",
        "How Important is It? ",
        "Just for Today ",
        "Keep an Open Mind ",
        "Keep Coming Back ",
        "Keep it Simple",
        "Let Go and Let God ",
        "Let it Begin with Me ",
        "Listen and Learn ",
        "Live and Let Live ",
        "One Day at a Time ",
        "Progress not Perfection",
        "Together We Can Make It ",
        ]
    
    var dbSlogans: [Phrase] = []
    for slogan in slogans {
        dbSlogans.append(initSlogan(slogan: slogan))
    }
    
    return dbSlogans
}

func initSayings() -> [Phrase] {
    let sayings: [String] = [
        "Detachment not Amputation ",
        "Look back without staring ",
        "If in Doubt, Don’t ",
        "This Too Shall Pass ",
        "Obedience to the Unenforceable ",
        "Live at Peace with Ourselves & Others ",
        "Take Care of Yourself ",
        "Quiet the Mind, Open the Heart ",
        "The Healing is in the Hearing ",
        "Keep the Focus on Yourself ",
        "Take your Own Inventory (not someone elses) ",
        "Feelings Aren’t Facts ",
        "Foster an Attitude of Gratitude ",
        "Forgive or Relive ",
        "Anger is just one letter short of Danger ",
        "Forgiveness is giving up Hope for a better past ",
        "Principles above Personalities ",
        "An Expectation is a resentment waiting to happen ",
        "The voice of my Higher Power can’t be heard if I’m doing all the talking ",
        "Participation is the key to Harmony ",
        "Ask Yourself - Would you rather be right or be happy? ",
        "My mind is like a bad neighborhood - I should never go there alone ",
        "Doing service is like getting on the super highway to recovery ",
        "Pain is inevitable. Suffering is optional ",
        "Success is getting what you want. Happiness is wanting what you get. ",
        "It’s impossible to be resentful and grateful at the same time ",
        "\"No\" is a complete sentence ",
        "Acceptance has to occur before change can occur ",
        "Are you seeing the disease or the person? ",
        "The elevator to recovery is broken; please use the Steps instead ",
        "Stay in your own lane ",
        "Let emotions subside Before you decide"
        ]
    
    var dbSayings: [Phrase] = []
    for saying in sayings {
        dbSayings.append(initSaying(saying: saying))
    }
    
    return dbSayings
}

func initAcronyms() -> [Phrase] {
    
    let acronyms: [String] = [
        "THREE A'S\n\tAwareness\n\tAcceptance\n\tAction",
        "THREE C’s\n\tI didn’t cause it\n\tI can’t control it\n\tI can’t cure it",
        "THREE UNWANTED P’s\n\tPerfectionism\n\tProcrastination\n\tParalysis",
        "THREE G’s\n\tGet off their back\n\tGet out of their way\n\tGet on with your life",
        "FOUR UNWANTED M’s\n\tMartyrdom\n\tManaging\n\tManipulating\n\tMothering",
        "THE STEPS, CONDENSED\n\t1-3 Peace with God\n\t4-7 Peace with Ourself\n\t8-10 Peace with Others\n\t1 1-12\tKeeping the Peace",
        "HALT IF YOU’RE\n\tHungry\n\tAngry\n\tLonely\n\tTired",
        "THINK - Is it.....?\n\tThoughtful\n\tHonest\n\tIntelligent\n\tNecessary\n\tKind",
        "FEAR\n\tFalse\n\tEvidence\n\tAppearing\n\tReal",
        "HOPE\n\tHappy\n\tOur\n\tProgram\n\tExists",
        "NUTS\n\tNot\n\tUsing\n\tThe\n\tSteps",
        "DETACH\n\tDon’t\n\tEven \n\tThink\n\tAbout\n\tChanging Him/Her/Them",
        "HOW\n\tHonest\n\tOpen\n\tWilling",
        "STEPS\n\tSolutions\n\tTo\n\tEvery\n\tProblem",
        "QTIP\n\tQuit\n\tTaking\n\tIt\n\tPersonally",
        "DENIAL\n\tDon’t\n\tEven\n\tNotice\n\tI\n\tAm \n\tLying",
        "LOVE\n\tLet\n\tOthers\n\tVoluntarily\n\tEvolve"
    ]
    
    var dbAcronyms: [Phrase] = []
    
    for acronym in acronyms {
        dbAcronyms.append(initAcronym(acronym: acronym))
    }
    
    return dbAcronyms
}
