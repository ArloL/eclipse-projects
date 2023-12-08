# Arlo's Eclipse project catalog

This is my project catalog for the Eclipse Installer.

Add it to your Installer by adding this line to `eclipse-inst.ini`:

```
-Doomph.redirection.arlosProjectCatalog=index:/redirectable.projects.setup->https://arlol.github.io/eclipse-projects/eclipse-projects.setup
```

On macOS this does the trick:

```
echo "-Doomph.redirection.arlosProjectCatalog=index:/redirectable.projects.setup->https://arlol.github.io/eclipse-projects/eclipse-projects.setup" >> /Applications/Eclipse\ Installer.app/Contents/Eclipse/eclipse-inst.ini
```
