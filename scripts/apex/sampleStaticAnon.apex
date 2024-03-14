//accessing non-static variable and method
SampleClassForStatic scfs = new SampleClassForStatic();
scfs.sampleStr = 'assigning value to non-static variable';
scfs.sampleMethod();

//accessing non-static variable and method
SampleClassForStatic scfs2 = new SampleClassForStatic();
scfs2.sampleStr = 'some value';
scfs2.sampleMethod();


//accessing static variable and method
SampleClassForStatic.sampleStaticStr = 'assigning value to static variable';
SampleClassForStatic.sampleStaticMethod();

//trying to access private static variable
SampleClassForStatic.sampleStaticPrivateStr = 'set value';