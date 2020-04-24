# femtoposter
A Tikz based LaTeX class for FEMTO-ST posters.
https://www.femto-st.fr/en

# Content
- femtoposter.cls : LaTeX class file
- minimalist_example[.tex,.pdf] : a minimal working example that presents introduced commands
- femtoposter_example[.tex,.pdf] : a more complete example that shows text, figures and lists integration

# Requirements
In order to compile your poster you *must* use `LuaTeX` (or XeTeX, but I didn't tested it). The "classical" `pdftex` engine won't work.
This is due to the [fontspec](https://ctan.org/pkg/fontspec) package, required to handle fonts and their sizes.
