# Children Tags With Footers

Provides extra footer children tags, in addition to the children header tag.

## Example

    <r:children:each order="desc" by="published_at">
        <r:header>
          <div class="month" id="<r:date format='f%Y-%m' />">
            <h2><a class="toggle" href="<r:date format='#f%Y-%m' />"><r:date format="%B %Y" /> <span>-</span></a></h2>
            <div class="events">
              <dl>
        </r:header>
                <dt class="day"><r:date format="%d" /></dt>
                <dd><r:link><r:title /></r:link></dd>
                <dd class="sep"></dd>
        <r:footer>
              </dl>
              <p class="close"><a class="toggle" href="<r:date format='#f%Y-%m' />">[ - ]</a></p>
            </div>
          </div><!-- end <r:date format="%Y-%m" /> -->
        </r:footer>
    </r:children:each>
    <r:children:last_footer />
    
can output something like this

    <div class="month" id="f2008-12">
      <h2><a class="toggle" href="#f2008-12">December 2008 <span>-</span></a></h2>
      <div class="events">
        <dl>
            <dt class="day">20</dt>
            <dd><a href="/events/2008/12/20/lorem/">Ipsum</a></dd>
            <dd class="sep"></dd>
    
            <dt class="day">19</dt>
            <dd><a href="/events/2008/12/19/dolor/">Dolor</a></dd>
            <dd class="sep"></dd>
        </dl>
        <p class="close"><a class="toggle" href="#f2008-12">[ - ]</a></p>
      </div>
    </div><!-- end 2008-12 -->
    
    <div class="month" id="f2008-11">
      <h2><a class="toggle" href="#f2008-11">November 2008 <span>-</span></a></h2>
      <div class="events">
        <dl>
          <dt class="day">24</dt>
          <dd><a href="/events/2008/11/24/an-other-event/">My new event</a></dd>
          <dd class="sep"></dd>
          
          <dt class="day">07</dt>
          <dd><a href="/events/2008/11/07/remember-it/">Radiant keynote.</a></dd>
          <dd class="sep"></dd>
          
          <dt class="day">01</dt>
          <dd><a href="/events/2008/11/01/brh/">Blonde Redhead concert.</a></dd>
          <dd class="sep"></dd>
        </dl>
        <p class="close"><a class="toggle" href="#f2008-11">[ - ]</a></p>
      </div>
    </div><!-- end 2008-11 -->

