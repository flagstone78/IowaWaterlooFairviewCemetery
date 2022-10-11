
"""
Description of this extension
"""

import inkex

class listProperty(inkex.EffectExtension):
    """Please rename this class, don't keep it unnamed"""
    def add_arguments(self, pars):
        pass

    def effect(self):
        my_objects = self.svg.selected
        idlist = ""
        for my_object in my_objects:
            my_id = my_object.get_id()
            my_label = my_object.label
            idlist += "'"my_id +"',"
         
        inkex.errormsg(f'{idlist[:-1]}')

if __name__ == '__main__':
    listProperty().run()
