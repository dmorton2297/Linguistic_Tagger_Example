//
// Playground demonstrating how to using lingustic tagger
// Code based off of blog post http://nshipster.com/nslinguistictagger/
//

import Foundation

let statement = "We are going to chipotle to eat a burrito"
let options: NSLinguisticTaggerOptions = [.JoinNames, .OmitWhitespace, .OmitPunctuation]
let schemes = NSLinguisticTagger.availableTagSchemesForLanguage("en")
let tagger = NSLinguisticTagger(tagSchemes: schemes, options: Int(options.rawValue))
tagger.string = statement
tagger.enumerateTagsInRange(NSMakeRange(0, statement.characters.count), scheme:  NSLinguisticTagSchemeNameTypeOrLexicalClass, options: options) { (partOfSpeech, rangeInSentence, _, _) in
    let partOfSentence = (statement as NSString).substringWithRange(rangeInSentence)
    print("\(partOfSentence) : \(partOfSpeech)")
}