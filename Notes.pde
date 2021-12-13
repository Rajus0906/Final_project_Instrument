class note implements Instrument
{
  void noteOn( float dur )
  {
    if ( note9Row[beat] ) note9.trigger();
    if ( note8Row[beat] ) note8.trigger();
    if ( note7Row[beat] ) note7.trigger();
    if ( note6Row[beat] ) note6.trigger();
    if ( note5Row[beat] ) note5.trigger();
    if ( note4Row[beat] ) note4.trigger();
    if ( note3Row[beat] ) note3.trigger();
    if ( note2Row[beat] ) note2.trigger();
    if ( note1Row[beat] ) note1.trigger();
  }
  
  void noteOff()
  {
    
    beat = (beat+1)%16;
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, this );
  }
}
