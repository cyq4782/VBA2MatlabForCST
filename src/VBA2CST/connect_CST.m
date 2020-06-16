% initialize CST
cst = actxserver('CSTStudio.application');
mws = invoke(cst, 'NewMWS');
app = invoke(mws, 'GetApplicationName');
ver = invoke(mws, 'GetApplicationVersion');
invoke(mws, 'FileNew');
path=pwd;
filename='\test2.cst';
fullname=[path filename];
invoke(mws, 'SaveAs', fullname, 'True');
invoke(mws, 'DeleteResults');