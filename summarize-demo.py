#!/usr/bin/env python
from bottle import Bottle, request, view
from summarize import summarize


DEMO_TEXT = (
    "Alice and Bob are friends. Alice is fun and cuddly. Bob is cute and"
    " quirky. Together they go on wonderful adventures in the land of"
    " tomorrow. Alice's cuddlines and Bob's cuteness allow them to reach"
    " their goals. But before they get to them, they have to go past their"
    " mortal enemy — Mr. Boredom. He is ugly and mean. They will surely"
    " defeat him. He is no match for their abilities."
)


app = Bottle()


@app.route('/', method='GET')
@app.route('/', method='POST')
@view('index')
def index():
    text = request.forms.getunicode('text')
    number = int_or_none(request.forms.get('number'))
    result = summarize(text, number) if number and text else None
    return {
        'text': text or DEMO_TEXT,
        'result': result,
        'number': number or 5,
    }


def int_or_none(value):
    try:
        return int(value)
    except TypeError:
        return None


if __name__ == "__main__":
    app.run()
