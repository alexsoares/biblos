# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base


    include AuthenticatedSystem
    include RoleRequirementSystem
    
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1fe35b6b035a105802fded2a2460b211'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
SENHA = 'seduc@pma'
PERIODO = {'MATUTINO' => 'MATUTINO',  'VESPERTINO' => 'VESPERTINO', 'NOTURNO' => 'NOTURO'}
PERIODOT = {'MATUTINO' => 'MATUTINO',  'VESPERTINO' => 'VESPERTINO', 'ITINERANTE' => 'ITINERANTE'}
TIPOPERIODICO = {'ANUARIO' => 'ANUARIO','BOLETIM' => 'BOLETIM',  'JORNAL' => 'JORNAL','REVISTA' => 'REVISTAS',  'OUTROS'=>'OUTROS'}
TIPOSMIDIA = {'CD' => 'CD','DVD' => 'DVD','VHS' => 'VHS','OUTROS'=>'OUTROS'}
TIPOSMAPA = {'TOPOGRÁFICO'=>'TOPOGRÁFICO','GEOGRÁFICO' => 'GEOGRÁFICO','BIOGRÁFICO' => 'BIOGRÁFICO','CLIMÁTICO' => 'CLIMÁTICO','HIDROGRÁFICO' => 'HIDROGÁFICO','DEMOGRÁFICO' => 'DEMOGRÁFICO',' POLITICO' => 'POLITICO','HISTÓRICO' => 'HISTÓRICO',  'RODOVIÁRIO' => 'RODOVIÁRIO','ECONÔMICO' => 'ECONÔMICO', 'OUTROS'=>'OUTROS'}
FAIXAETARIA = {'0 A 03 ANOS'=>'0 A 03 ANOS','04 A 05 ANOS' => '04 A 05 ANOS','06 A 07 ANOS' => '06 A 07 ANOS','08 A 10 ANOS' => '08 A 10 ANOS','11 A 13 ANOS' => '11 A 13 ANOS','14 OU MAIS' => '14 OU MAIS'}
PERIODICIDADE = {'DIARIO' => 'DIARIO','SEMANAL' => 'SEMANAL',  'QUINZENAL' => 'QUINZENAL','MENSAL' => 'MENSAL','SEMETRAL' => 'SEMESTRAL','ANUAL' => 'ANUAL',  'OUTROS'=>'OUTROS'}
FORMAAQUISICAO = {'DOAÇÂO' => 'DOAÇÃO','AQUISIÇÂO SEDUC' => 'AQUISIÇÂO SEDUC','AQUISIÇÂO UNIDADE' => 'AQUISIÇÂO UNIDADE',  'ENVIADO MEC' => 'ENVIADO MEC','ENVIADO SEC.ESTADUAL.EDUC.' => 'ENVIADO SEC.ESTADUAL.EDUC.', 'OUTROS'=>'OUTROS'}