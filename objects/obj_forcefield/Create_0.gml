var _posting = "Unlock FF " + string(Forcefield_Number);
pubsub_subscribe(_posting,function(_val){

if(_val){
instance_destroy();	
}

})



ff_palette = pal_forcefield;
ff_palette_num = 2;
steps = 12;
pal_surface = Set_cycle_palette(ff_palette,ff_palette_num,c_yellow,c_red,steps);
