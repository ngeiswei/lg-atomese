;
; dict-lookup.scm -- look up a word in a dictionary.
;
; Link Grammar specifies natural languages in terms of a dictionary of
; words, with each dictionary entry describing all of the ways in which
; a word can link up to other nearby words. Direct access to that
; dictionary can be useful; this demo shows how to look up the
; dictionary entries for individual words.
;--------------------------------------------------------------------

; Load the guile modules
(use-modules (opencog) (opencog exec))
(use-modules (opencog nlp) (opencog nlp lg-dict))

; For English only, there is a very simple utility for looking up
; individual words -- `lg-dict-entry`. Use it like so:
(lg-dict-entry (Word "yikes"))

; That's all there's to it. For languages other than English,
; there's only a little bit more to do. Here is the above example,
; again, in it's direct form:
(cog-execute! (LgDictEntry (Word "yikes") (LgDictNode "en")))
(cog-incoming-by-type (Word "yikes") 'LgDisjunct)

; The `lg-dict-entry` utility is just a fancy wrapper on the above
; two lines of code. All that it does is to avoid a second lookup
; if a lookup has already been done before.

; -----------
; Here's an example of a lookup in the Russian dictionary:
(cog-execute! (LgDictEntry (Word "доктор") (LgDictNode "ru")))
(cog-incoming-by-type (Word "доктор") 'LgDisjunct)

; Note that Russian has a complex morphology, and this is reflected
; in the much larger dictionary entries.

; -----------
; The `(opencog nlp lg-dict)` provides a number of useful utilities and
; tools.

; Is a word in a dictionary? Returns true or false:
(cog-evaluate! (LgHaveDictEntry (Word "доктор") (LgDictNode "ru")))
(cog-evaluate! (LgHaveDictEntry (Word "дasdf") (LgDictNode "ru")))

; Note that `cog-evaluate!` is used here, not `cog-execute!`

; Other utility functions include:
;
; lg-conn-type-match?
; lg-conn-linkable?
; lg-conn-get-type
; lg-conn-get-dir
;
; You can get documentation for each with the ,d or ,describe command
; at the guile prompt. For example:
,d lg-conn-linkable?
