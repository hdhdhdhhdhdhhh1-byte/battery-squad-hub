-- Restrict EXECUTE on SECURITY DEFINER functions: revoke from PUBLIC/anon,
-- grant only where actually needed. Trigger-only functions get no grants.

-- Trigger-only functions (called by triggers, not by API roles)
REVOKE ALL ON FUNCTION public.set_updated_at() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.enforce_approved_entries_lock() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.enforce_approved_report_lock() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.handle_new_user() FROM PUBLIC, anon, authenticated;

-- App-callable helpers: signed-in users only
REVOKE ALL ON FUNCTION public.my_permissions() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.my_permissions() TO authenticated;

REVOKE ALL ON FUNCTION public.my_role() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.my_role() TO authenticated;

REVOKE ALL ON FUNCTION public.my_is_admin() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.my_is_admin() TO authenticated;

REVOKE ALL ON FUNCTION public.my_pages() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.my_pages() TO authenticated;

REVOKE ALL ON FUNCTION public.person_current_status(uuid) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.person_current_status(uuid) TO authenticated;

REVOKE ALL ON FUNCTION public.latest_approved_report_date() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.latest_approved_report_date() TO authenticated;

REVOKE ALL ON FUNCTION public.has_permission(uuid, text, text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.has_permission(uuid, text, text) TO authenticated;

REVOKE ALL ON FUNCTION public.has_role(uuid, public.app_role) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.has_role(uuid, public.app_role) TO authenticated;

REVOKE ALL ON FUNCTION public.is_admin(uuid) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_admin(uuid) TO authenticated;
