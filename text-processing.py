import nltk.data
import sys
from string import ascii_lowercase
from evolution import evolution, print_evolution

def split_sentences(text):
  sentence_detector = nltk.data.load('tokenizers/punkt/english.pickle')
  sentences = sentence_detector.tokenize(text.strip())
  return sentences

def filter_sentence(sentence):
  sentence = sentence.lower()
  sentence = [x for x in sentence if x in ascii_lowercase+" "]
  sentence = "".join(sentence)
  return sentence


def process_text(filename):
  text = open(filename,"r").read()
  sentences = split_sentences(text)
  sentences = [filter_sentence(x) for x in sentences]
  sentences = [x for x in sentences if len(x) > 10]
  return sentences

sentences = process_text("text_data/catcher_in_the_rye.txt")
for sentence in sentences:
  print_evolution(sentence)
  sys.stdout.flush()


