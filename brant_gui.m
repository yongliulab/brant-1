function brant_gui(userdata)

[jobman, ui_strucs] = brant_postprocess_defaults(userdata);
brant_postprocesses_sub(userdata, jobman, ui_strucs);
