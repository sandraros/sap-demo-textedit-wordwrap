REPORT.

data okcode type syucomm.
data go_text1 type REF TO cl_gui_textedit.
data go_cc1   type REF TO cl_gui_custom_container.
data go_text2 type REF TO cl_gui_textedit.
data go_cc2   type REF TO cl_gui_custom_container.
data go_text3 type REF TO cl_gui_textedit.
data go_cc3   type REF TO cl_gui_custom_container.
data go_text4 type REF TO cl_gui_textedit.
data go_cc4   type REF TO cl_gui_custom_container.
data go_text5 type REF TO cl_gui_textedit.
data go_cc5   type REF TO cl_gui_custom_container.
data go_text6 type REF TO cl_gui_textedit.
data go_cc6   type REF TO cl_gui_custom_container.
data go_text7 type REF TO cl_gui_textedit.
data go_cc7   type REF TO cl_gui_custom_container.
data go_text8 type REF TO cl_gui_textedit.
data go_cc8   type REF TO cl_gui_custom_container.
data go_text9 type REF TO cl_gui_textedit.
data go_cc9   type REF TO cl_gui_custom_container.
data text type string.
types : BEGIN OF ty_text_structure,
          l1 TYPE c length 40,
          l2 type c length 40,
          l3 type c length 40,
        end of ty_text_structure.
data t1 type string.
data t1_structure type ty_text_structure.
data t1l1 type c length 40.
data t1l2 type c length 40.
data t1l3 type c length 40.
data t4 type string.
data t4_structure type ty_text_structure.
data t4l1 type c length 40.
data t4l2 type c length 40.
data t4l3 type c length 40.

text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' && |\r\n|
&& 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' && |\r\n|
&& 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' && |\r\n|
&& 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'.

CREATE OBJECT go_cc1
  EXPORTING
    container_name = 'CC1'.
CREATE OBJECT go_text1
  EXPORTING
    parent = go_cc1
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_AT_FIXED_POSITION
    WORDWRAP_POSITION = 20
    WORDWRAP_TO_LINEBREAK_MODE = CL_GUI_TEXTEDIT=>falsE.
go_text1->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc2
  EXPORTING
    container_name = 'CC2'.
CREATE OBJECT go_text2
  EXPORTING
    parent = go_cc2
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_AT_WINDOWBORDER
    WORDWRAP_TO_LINEBREAK_MODE = CL_GUI_TEXTEDIT=>falsE.
go_text2->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc3
  EXPORTING
    container_name = 'CC3'.
CREATE OBJECT go_text3
  EXPORTING
    parent = go_cc3
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_OFF.
go_text3->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc4
  EXPORTING
    container_name = 'CC4'.
CREATE OBJECT go_text4
  EXPORTING
    parent = go_cc4
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_AT_FIXED_POSITION
    WORDWRAP_POSITION = 20
    WORDWRAP_TO_LINEBREAK_MODE = CL_GUI_TEXTEDIT=>truE.
go_text4->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc5
  EXPORTING
    container_name = 'CC5'.
CREATE OBJECT go_text5
  EXPORTING
    parent = go_cc5
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_AT_WINDOWBORDER
    WORDWRAP_TO_LINEBREAK_MODE = CL_GUI_TEXTEDIT=>truE.
go_text5->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc6
  EXPORTING
    container_name = 'CC6'.
CREATE OBJECT go_text6
  EXPORTING
    parent = go_cc6
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_OFF.
go_text6->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc7
  EXPORTING
    container_name = 'CC7'.
CREATE OBJECT go_text7
  EXPORTING
    parent = go_cc7
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_OFF.
go_text7->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).
go_text7->set_readonly_mode( EXPORTING readonly_mode = go_text7->TRUE EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc8
  EXPORTING
    container_name = 'CC8'.
CREATE OBJECT go_text8
  EXPORTING
    parent = go_cc8
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_OFF.
go_text8->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).
go_text8->set_toolbar_mode( EXPORTING toolbar_mode = go_text8->FALSE EXCEPTIONS others = 3 ).

CREATE OBJECT go_cc9
  EXPORTING
    container_name = 'CC9'.
CREATE OBJECT go_text9
  EXPORTING
    parent = go_cc9
    WORDWRAP_MODE = CL_GUI_TEXTEDIT=>WORDWRAP_OFF.
go_text9->set_textstream( EXPORTING text = text EXCEPTIONS others = 3 ).
go_text9->set_statusbar_mode( EXPORTING statusbar_mode = go_text9->falsE EXCEPTIONS others = 3 ).

CALL SCREEN 100.

MODULE STATUS_0100.
ENDMODULE.

MODULE USER_COMMAND_0100.
  case OKCODE.
    when 'EXIT'.
      set screen 0.
    when 'SAVE1'.
      go_text1->get_textstream( IMPORTING text = t1 EXCEPTIONS others = 3 ).
      cl_gui_cfw=>flush( ).
      replace ALL OCCURRENCES OF |\n| in t1 with '\n'.
      replace ALL OCCURRENCES OF |\r| in t1 with '\r'.
      t1_structure = t1.
      t1l1 = t1_structure-l1.
      t1l2 = t1_structure-l2.
      t1l3 = t1_structure-l3.
    when 'SAVE4'.
      go_text4->get_textstream( IMPORTING text = t4 EXCEPTIONS others = 3 ).
      cl_gui_cfw=>flush( ).
      replace ALL OCCURRENCES OF |\n| in t4 with '\n'.
      replace ALL OCCURRENCES OF |\r| in t4 with '\r'.
      t4_structure = t4.
      t4l1 = t4_structure-l1.
      t4l2 = t4_structure-l2.
      t4l3 = t4_structure-l3.
  endcase.
ENDMODULE.
