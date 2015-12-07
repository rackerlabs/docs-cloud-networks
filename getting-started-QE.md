##Content architecture check

**Getting Started navigation**

- [X] Link at top of doc
  
      ![Part links](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-part-links.png)
  
- [X] Content hierarchy for top-sections looks like one of these two models, with GS title in nav
  
      ![Nav with curl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-nav-curl-only.png) 
      ![Nav with curl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-nav-with-client.png) 

##Content check

**Use cases and examples**

- [X] Compare use case (topics) in migrated content to original content on docs.rackspace.com to identify any missing content

- [X] Use case H1 topics use imperative, H2 topics use gerund

      ![Use case titles](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-use-case-titles.png) 


**Getting Started common content**

- [NOT DONE]  Prerequisites include config environment variables (late change) 
       
       ![Gen API authl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-prereqs.png) 
       

- [X]  GS intro topic that follows boiler plate, might have extra content depending on product.

       ![Gen API authl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-intro.png) 
       

- [X]  Uses common Get Credentials topic ==> Save your API Key, Save your Account number are heading levels.

       ![Get Credsl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-getcreds.png) 


- [X]  Send API requests content follows template (some docs have only cURL, some have cURL and CLI)
      

- [X]  Authenticate uses [common content](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/#document-getting-started/authenticate) 


- [X]  Review auth response section has link to annotated auth response.

       ![Get Credsl](https://github.com/rackerlabs/docs-common/blob/master/rst/getting-started-content-architecture/QE-images/GS-note-annotated-auth-ref.png) 


**General API section**

- [X] Authentication section contains short section referencing GS auth example and Identity doc. 
      See [example](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/#document-general-api-info/authentication-gen-api)


- [X] Service access endpoints topic follows authentication

- [X] Service access endpoints topic has link to auth response in Review Auth response section.

- [X] How to use cURL topic not included in the General API section (info provided in common auth section)


##Copy check

**Check links**

- [X] Run link check on page.

- [X] Look for malformed internal and external cross-references

- [X] Look for link references that aren't linked, or links that refer to html topics from docs.rackspace.com

- [X] Look for missing punctuation when link is at end of sentence.  
          (Leave a space between the end of link and the punctuation. ```This is a :ref:`test <refid>` .```

**Code samples**

- [X] Make sure spacing is OK -- as good as it can be.

- [X] Examples use environment variables -- ``$ENDPOINT``, ``$TENANT_ID``, and ``$AUTH_TOKEN``  (just mark it if not used, not critical but prefereable.)

- [X] Paragraph text not merged into code samples.

**Inline markup**

- [X] Look for stray ` or * symbols or funny spacing

- [X] Find Bold, italic, or inline literal rendering issues

- [X] Look for stray | or html leftovers  (margin: 0 ... )

**Tables**

- [X] Check formatting and inline markup for weird stuff

- [X] Tables have titles 

**Lists**

- [X] Look for strange indenting or bolding (ragged margins make Sphinx think things are dl lists.)
