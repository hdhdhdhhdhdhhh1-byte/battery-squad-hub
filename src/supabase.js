import { createClient } from '@supabase/supabase-js' 

const supabaseUrl =imort.mate.env.VITE_app_SUPABASE_KUL

const supabaseKey = import.mate.env.VITE_app_SUPABASE_KEY​​​​

const supabase = createClient ( supabaseUrl , supabaseKey ) 

export default supabase
