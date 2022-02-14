import nltk, math
from nltk.corpus import stopwords

# nltk.download('stopwords")

def top_words(text):
    record = {}
    common_words = stopwords.words('english')
    common_words += ['use', 'would', 'first', 'make', 'like',
    'one', 'time', 'word', 'look', 'two', 'find', 'long', 'go',
    'day', 'see',  'many', 'number', 'get', 'come', 'way', 'made',
    'could', 'may', 'I', 'said', 'people', 'part']
    for line in text:
        words = line.split()
        for word in words:
            w = word.strip('.!?,()\n').lower()
            if w in record:
                record[w] += 1
            else:
                record[w] = 1
    for word in record.keys():
        if word in common_words:
            record[word] = -1
    occur = [key for key in record.keys()]
    occur.sort(reverse=True, key=lambda x: record[x])
    return set(occur[:math.ceil(len(occur)/10)])


def calculate_score(words, significant, gap = 4):
    score = 0
    sig_words = 0
    start_index = -1
    end_index = 0
    last_signifcant = gap
    for i in range(len(words)):
        if words[i] in significant:
            if start_index == -1:
                start_index = i
            sig_words += 1
            last_signifcant = gap
            end_index = i
        else:
            last_signifcant -= 1
        if last_signifcant == 0:
            score = max(score, sig_words*sig_words/(1+end_index-start_index))
            start_index = -1
            sig_words = 0
            last_signifcant = gap
    if sig_words != 0:
        score = max(score, sig_words*sig_words/(1+end_index-start_index))
    return score

text = """Ad sales boost Time Warner profit.

Quarterly profits at US media giant TimeWarner jumped 76% to $1.13bn (£600m) for the three months to December, from $639m year-earlier.

The firm, which is now one of the biggest investors in Google, benefited from sales of high-speed internet connections and higher advert sales. TimeWarner said fourth quarter sales rose 2% to $11.1bn from $10.9bn. Its profits were buoyed by one-off gains which offset a profit dip at Warner Bros, and less users for AOL.

Time Warner said on Friday that it now owns 8% of search-engine Google. But its own internet business, AOL, had has mixed fortunes. It lost 464,000 subscribers in the fourth quarter profits were lower than in the preceding three quarters. However, the company said AOL's underlying profit before exceptional items rose 8% on the back of stronger internet advertising revenues. It hopes to increase subscribers by offering the online service free to TimeWarner internet customers and will try to sign up AOL's existing customers for high-speed broadband. TimeWarner also has to restate 2000 and 2003 results following a probe by the US Securities Exchange Commission (SEC), which is close to concluding.

Time Warner's fourth quarter profits were slightly better than analysts' expectations. But its film division saw profits slump 27% to $284m, helped by box-office flops Alexander and Catwoman, a sharp contrast to year-earlier, when the third and final film in the Lord of the Rings trilogy boosted results. For the full-year, TimeWarner posted a profit of $3.36bn, up 27% from its 2003 performance, while revenues grew 6.4% to $42.09bn. "Our financial performance was strong, meeting or exceeding all of our full-year objectives and greatly enhancing our flexibility," chairman and chief executive Richard Parsons said. For 2005, TimeWarner is projecting operating earnings growth of around 5%, and also expects higher revenue and wider profit margins.

TimeWarner is to restate its accounts as part of efforts to resolve an inquiry into AOL by US market regulators. It has already offered to pay $300m to settle charges, in a deal that is under review by the SEC. The company said it was unable to estimate the amount it needed to set aside for legal reserves, which it previously set at $500m. It intends to adjust the way it accounts for a deal with German music publisher Bertelsmann's purchase of a stake in AOL Europe, which it had reported as advertising revenue. It will now book the sale of its stake in AOL Europe as a loss on the value of that stake."""

sent = nltk.sent_tokenize(text)
words = [nltk.word_tokenize(s) for s in sent]

significant = top_words([text])

sig_ranked = []
for i, w in enumerate(words):
    score = calculate_score(w, significant)
    sig_ranked.append([score, i])

sig_ranked.sort(reverse=True)
for i, sig in enumerate(sig_ranked):
    score, j = sig
    print(f"#{i+1} sentence with a score of {score}:\n {sent[j]}")