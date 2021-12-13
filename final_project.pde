//referenced off of the minim example
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import gifAnimation.*;

Gif monkey;

Minim       minim;
AudioOutput out;

Sampler     note1;
Sampler     note2;
Sampler     note3;
Sampler     note4;
Sampler     note5;
Sampler     note6;
Sampler     note7;
Sampler     note8;
Sampler     note9;

boolean[] note9Row = new boolean[16];
boolean[] note8Row = new boolean[16];
boolean[] note7Row = new boolean[16];
boolean[] note6Row = new boolean[16];
boolean[] note5Row = new boolean[16];
boolean[] note4Row = new boolean[16];
boolean[] note3Row = new boolean[16];
boolean[] note2Row = new boolean[16];
boolean[] note1Row = new boolean[16];

ArrayList<Rect> buttons = new ArrayList<Rect>();
int bpm = 120;
int beat;


void setup()
{
  size(600, 500,P2D);
  minim = new Minim(this);
  out   = minim.getLineOut();
  
  monkey = new Gif(this, "dancingMonkey.gif");
  monkey.loop();
 
  //(all notes were made by me on my piano)
  note1  = new Sampler( "0.mp3", 4, minim);
  note2 = new Sampler( "1.mp3", 4, minim);
  note3   = new Sampler( "2.mp3", 4, minim);
  note4  = new Sampler( "3.mp3", 4, minim);
  note5 = new Sampler( "4.mp3", 4, minim);
  note6   = new Sampler( "5.mp3", 4, minim);
  note7  = new Sampler( "6.mp3", 4, minim);
  note8 = new Sampler( "7.mp3", 4, minim);
  note9  = new Sampler( "8.mp3", 4, minim);
  
  note1.patch( out );
  note2.patch( out );
  note3.patch( out );
  note4.patch( out );
  note5.patch( out );
  note6.patch( out ); 
  note7.patch( out );
  note8.patch( out );
  note9.patch( out ); 
  
  
  for (int i = 0; i < 16; i++)
  {
    buttons.add( new Rect(10+i*37, 200, note9Row, i ) );
    buttons.add( new Rect(10+i*37, 100, note8Row, i ) );
    buttons.add( new Rect(10+i*37, 150, note7Row, i ) );
    buttons.add( new Rect(10+i*37, 50, note6Row, i ) );
    buttons.add( new Rect(10+i*37, 100, note5Row, i ) );
    buttons.add( new Rect(10+i*37, 150, note4Row, i ) );
    buttons.add( new Rect(10+i*37, 50, note3Row, i ) );
    buttons.add( new Rect(10+i*37, 100, note2Row, i ) );
    buttons.add( new Rect(10+i*37, 150, note1Row, i ) );
  }
  
  beat = 0;
  
  out.setTempo( bpm );
  out.playNote( 0, 0.25f, new note() );
}

void draw()
{
  background(#8AC4D8);
  image(monkey, 130,270);
  
  for(int i = 0; i < buttons.size(); ++i)
  {
    buttons.get(i).draw();
  }
  
  stroke(0);
  if ( beat % 4 == 0 )
  {
    fill(#D700DB);
  }
  else
  {
    fill(#08BFFF);
  }
      
  rect(10+beat*37, 35, 20, 215);
}
