#!/usr/bin/python
import Tkinter as tk
import tkFont
import pdb; bp = pdb.set_trace

APP_NAME = 'Screen Flasher'
VERSION_NUMBER = '1.0'
INIT_FLASH_FREQ = 100
INIT_FULL_SCREEN = True
INIT_COLOR_1 = 'red'
INIT_COLOR_2 = 'green'
SCREEN_WIDTH, SCREEN_HEIGHT = [300, 300]
SPEED_MIN = 50; SPEED_MAX = 300
DEFAULT_MESSAGE = 'Look at the screen!'

class ScreenFlash(object):
    def __init__(self):
        self.init_vars()
        self.init_tk()
        self.flash_screen()
        if INIT_FULL_SCREEN:
            self.tk.attributes("-fullscreen", True)

    def init_vars(self):
        self.screen_flashing = False
        self.cur_color = 0
        self.flash_freq = INIT_FLASH_FREQ
        self.col1 = INIT_COLOR_1
        self.col2 = INIT_COLOR_2
        self.full_screen = INIT_FULL_SCREEN
        
    def init_tk(self):
        global SCREEN_WIDTH, SCREEN_HEIGHT
        self.tk = tk.Tk()
        SCREEN_WIDTH = self.tk.winfo_screenwidth()
        SCREEN_HEIGHT = self.tk.winfo_screenheight()
        self.tk.geometry('+300+300')
        self.tk.wm_title(APP_NAME + ' Version ' + VERSION_NUMBER)
        self.root = tk.Frame(self.tk)
        self.root.grid(row=0, column=0, sticky='nsew')

        # Row weighting
        top=self.tk.winfo_toplevel()
        top.rowconfigure(0, weight=1)  
        top.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
                
        # List of buttons and callbacks
        buttons = ['Flash Screen', 'Send Message', 'Toggle Full Screen', 'Quit']
        for name in buttons:
            name_var = name.lower().replace(' ', '_')
            button_attr = getattr(self, '_'.join(['cb', name_var,
                                                   'button_clicked']))
            button = tk.Button(self.root, text=name, width=20,
                               command=button_attr)
            column_cnt = buttons.index(name)
            button.grid(column=column_cnt, row=1, sticky='nsew')
            self.root.columnconfigure(column_cnt, weight=1)

        # Speed Scale
        self.speed_scale = tk.Scale(self.root, from_=SPEED_MIN, to=SPEED_MAX,
                                    orient=tk.HORIZONTAL,length=300)
        self.speed_scale.grid(column=0,row=2)
        self.speed_scale.set(self.flash_freq)

        # Text Entry
        self.message = tk.StringVar()
        self.message.set(DEFAULT_MESSAGE)
        entry = tk.Entry(self.root,
                         textvariable=self.message).grid(column=1,row=2)
        
        # Flasher Canvas Object
        self.flasher = tk.Canvas(self.root)
        self.flasher.grid(row=0,columnspan=column_cnt+1,sticky='nsew')
        
    def flash_screen(self):
        self.flash_freq = self.speed_scale.get()
        if self.screen_flashing:
            if self.cur_color:
                self.flasher.config(bg=self.col1)
                self.cur_color = 0
            else:
                self.flasher.config(bg=self.col2)
                self.cur_color = 1
        else:
            self.flasher.config(bg='light grey')
        self.root.update()
        self.root.after(self.flash_freq, self.flash_screen)

    def cb_flash_screen_button_clicked(self):
        if self.screen_flashing:
            self.screen_flashing = False
        else:
            self.screen_flashing = True

    def cb_send_message_button_clicked(self):
        self.flasher.delete('all')
        tmp = (self.flasher.winfo_width()/2,self.flasher.winfo_height()/2)
        canvas_id = self.flasher.create_text(tmp)
        size = 70
        tmp = tkFont.Font(family='Helvetica',size=size, 
                          name="font%s" % size)
        msg_text = self.message.get()
        self.flasher.itemconfig(canvas_id, text=msg_text, font=tmp,
                                fill='white')

    def cb_toggle_full_screen_button_clicked(self):
        if self.full_screen:
            self.root.config(width=200, height=200)
            self.tk.attributes("-fullscreen", False)
            self.full_screen = False
        else:
            self.tk.attributes("-fullscreen", True)
            self.full_screen = True

    def cb_quit_button_clicked(self):
        self.on_exit()
        
    def on_exit(self):
        self.tk.destroy()

if __name__ == '__main__':
    cur_app = ScreenFlash()
    cur_app.tk.mainloop()
