//api (url)
//we can call global class from any other org via API
//we can access this class within the org also.
global class SampleGlobalClass {

    
    
    //this method is accesible from our org only
    public static void samplePublicMethod(){
        System.debug('Sample Public Method');
    }

    //global method is accessible from outside
    global static void sampleGlobalMethod(){
        System.debug('Sample Global Method');
    }

}