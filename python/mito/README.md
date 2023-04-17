## Installing Mito
The Mito package has two prerequisites:

Python 3.6 or newer
Node.js
I’m assuming you have Python installed, but Node might be the issue. Please take a minute to install it, and you’re ready to proceed.

From here, let’s create a virtual environment for Mito:
```
python3 -m venv mitoenv
```

And now let’s activate it:
```
source mitoenv/bin/activate
```
Great! We can install the package next with the following command:
```
pip install mitosheet
```
Almost there — we’ll also need Jupyter Lab extension manager:
```
jupyter labextension install @jupyter-widgets/jupyterlab-manager@2
```
And that’s it! You can launch Jupyter lab with the following command:
```
jupyter lab
```
Let’s proceed with dataset loading in the next section.u