unit ctfStandardTests;

interface

uses
  ctfTestForm,
  ctfTestFrame,
  ctfTestNames,
  ctfTestControls,
  ctfTestComCtrls;

implementation

uses
  OpenCTF,
  Controls, // TImageList
  Forms, // TFrame
  ComCtrls, // TTabSheet
  Classes;

initialization

  OpenCTF.Add(TTComponentHandler.Create(TComponent));

  OpenCTF.Add(TComponentNameTestHandler.Create(TComponent, 'Component name tests'));

  OpenCTF.Add(TFrameTestHandler.Create(TFrame, 'Frame tests'));

  OpenCTF.Add(TImageListHandler.Create(TImageList, 'TImageList tests'));

  OpenCTF.Add(TTabSheetHandler.Create(TTabSheet));

end.
