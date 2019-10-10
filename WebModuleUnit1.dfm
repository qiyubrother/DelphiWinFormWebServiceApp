object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'DoAction'
      PathInfo = '/Do.a'
      OnAction = WebModule1DoActionAction
    end>
  Height = 230
  Width = 415
end
