from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)

RESUME_FILE = 'Theodore-MAYI-MOLA-Cloud-Engineer.pdf'


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/download-pdf')
def download_pdf():
    return send_from_directory(app.static_folder, RESUME_FILE, as_attachment=True, download_name=RESUME_FILE)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
