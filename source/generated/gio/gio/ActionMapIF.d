module gio.ActionMapIF;

private import gio.ActionIF;
private import gio.c.functions;
public  import gio.c.types;
private import glib.Str;
private import gobject.ObjectG;


/**
 * The GActionMap interface is implemented by #GActionGroup
 * implementations that operate by containing a number of
 * named #GAction instances, such as #GSimpleActionGroup.
 * 
 * One useful application of this interface is to map the
 * names of actions from various action groups to unique,
 * prefixed names (e.g. by prepending "app." or "win.").
 * This is the motivation for the 'Map' part of the interface
 * name.
 *
 * Since: 2.32
 */
public interface ActionMapIF{
	/** Get the main Gtk struct */
	public GActionMap* getActionMapStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_action_map_get_type();
	}

	/**
	 * Adds an action to the @action_map.
	 *
	 * If the action map already contains an action with the same name
	 * as @action then the old action is dropped from the action map.
	 *
	 * The action map takes its own reference on @action.
	 *
	 * Params:
	 *     action = a #GAction
	 *
	 * Since: 2.32
	 */
	public void addAction(ActionIF action);

	/**
	 * A convenience function for creating multiple #GSimpleAction instances
	 * and adding them to a #GActionMap.
	 *
	 * Each action is constructed as per one #GActionEntry.
	 *
	 * |[<!-- language="C" -->
	 * static void
	 * activate_quit (GSimpleAction *simple,
	 * GVariant      *parameter,
	 * gpointer       user_data)
	 * {
	 * exit (0);
	 * }
	 *
	 * static void
	 * activate_print_string (GSimpleAction *simple,
	 * GVariant      *parameter,
	 * gpointer       user_data)
	 * {
	 * g_print ("%s\n", g_variant_get_string (parameter, NULL));
	 * }
	 *
	 * static GActionGroup *
	 * create_action_group (void)
	 * {
	 * const GActionEntry entries[] = {
	 * { "quit",         activate_quit              },
	 * { "print-string", activate_print_string, "s" }
	 * };
	 * GSimpleActionGroup *group;
	 *
	 * group = g_simple_action_group_new ();
	 * g_action_map_add_action_entries (G_ACTION_MAP (group), entries, G_N_ELEMENTS (entries), NULL);
	 *
	 * return G_ACTION_GROUP (group);
	 * }
	 * ]|
	 *
	 * Params:
	 *     entries = a pointer to
	 *         the first item in an array of #GActionEntry structs
	 *     userData = the user data for signal connections
	 *
	 * Since: 2.32
	 */
	public void addActionEntries(GActionEntry[] entries, void* userData);

	/**
	 * Looks up the action with the name @action_name in @action_map.
	 *
	 * If no such action exists, returns %NULL.
	 *
	 * Params:
	 *     actionName = the name of an action
	 *
	 * Returns: a #GAction, or %NULL
	 *
	 * Since: 2.32
	 */
	public ActionIF lookupAction(string actionName);

	/**
	 * Removes the named action from the action map.
	 *
	 * If no action of this name is in the map then nothing happens.
	 *
	 * Params:
	 *     actionName = the name of the action
	 *
	 * Since: 2.32
	 */
	public void removeAction(string actionName);
}
