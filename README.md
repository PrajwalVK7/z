const handlePrev = () => {
  const currentSection = surveyData[currentSectionIndex];
  const prevScreenIndex = currentScreenIndex - 1;
  
  if (prevScreenIndex >= 0) {
    setCurrentScreenIndex(prevScreenIndex);
    setSection(currentSection.screens[prevScreenIndex]);
  } else {
    const prevSectionIndex = currentSectionIndex - 1;
    if (prevSectionIndex >= 0) {
      const prevSection = surveyData[prevSectionIndex];
      setCurrentSectionIndex(prevSectionIndex);
      setCurrentScreenIndex(prevSection.screens.length - 1);
      setSection(prevSection.screens[prevSection.screens.length - 1]);
    } else {
      console.log('This is the first screen');
    }
  }
  setProgress((currentScreenIndex / surveyData.length));
};
