/**
 * An apex page controller that takes the user to the right start page based on credentials or lack thereof
 */
public with sharing class CommunitiesLandingController {
    // committing landing controller again - github
    // Code we will invoke on page load.
    public PageReference forwardToStartPage() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');        
               
        system.debug('start url:'+startUrl);
        
        //If TOU is enabled for organization then redirect to the TOU page else to the default landing page.
        If(Label.PPA_ShowTermsOfUse.equalsIgnoreCase('No')){             
            return Network.communitiesLanding();
        }
        else{  
        
            if( startURL == Null ) {            
                startUrl = '/home/home.jsp';
            }        
            system.debug('tou url:'+Site.getPathPrefix() + '/PPA_TermsOfUse?startURL=' + EncodingUtil.urlEncode(startUrl, 'UTF-8'));
            return new PageReference(Site.getPathPrefix() + '/PPA_TermsOfUse?startURL=' + EncodingUtil.urlEncode(startUrl, 'UTF-8'));                
        }
    }
    
    public CommunitiesLandingController() {}
}