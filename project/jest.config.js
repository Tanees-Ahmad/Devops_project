module.exports = {
  reporters: [
    "default", // Default Jest reporter
    ["jest-junit", {
      outputDirectory: "./project",  // Folder to store the report
      outputName: "test-report.xml"       // Name of the report file
    }]
  ]
};

