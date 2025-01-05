### Project structure  
-To make splitting the power into two or more halves possible some interactions are handled by functions in Magic_commons, thus serving as a bridge between the different powers  
-This is still very much a work in progress  
-Each halve of the power occupies its own datapack and most of the functions are handled by the datapack for just that power  
-Magic is thus one half of the power and contains nearly every function needed for itself to function  
  
  
### Code style
-This is the style I try to follow when working on my datapack. Any imput is appriciated though  
  
**Scoreboards & macros**
-reg_1, reg_2, reg_3, reg_4, reg_5 are temporary registers. When not used by an entity the entity "Temp" should be used as a placeholder  
-Currently no convention exists on whether or not the register scoreboard should be presered between functions. 
-Unless the called function is very simple the register scoreboards should be assumed scratced 
-No convention either exists when passing data to a functions  
-Either @s reg_n or Temp reg_n or in case when nothing other works a macro is used  
-Macros should be named after the function they are fed to / used it
-The return values should be put in either @s reg_n or Temp reg_n, starting from n=1
-All scoreboards and storages should be removed by the cleanup functions  
-A better solution to this mess will sooner or later have to be adopted  
  
**Tags**
-Temporary tags that doesn't survive multiple ticks should be annotated with _temp
-Tags should have a name that corresponds to the function they are used in
-All tags should be removed by the cleanup functions  
