module gtk.ActionableIF;

private import glib.Str;
private import glib.Variant;
private import glib.c.functions;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkActionable` interface provides a convenient way of asscociating
 * widgets with actions.
 * 
 * It primarily consists of two properties: [property@Gtk.Actionable:action-name]
 * and [property@Gtk.Actionable:action-target]. There are also some convenience
 * APIs for setting these properties.
 * 
 * The action will be looked up in action groups that are found among
 * the widgets ancestors. Most commonly, these will be the actions with
 * the “win.” or “app.” prefix that are associated with the
 * `GtkApplicationWindow` or `GtkApplication`, but other action groups that
 * are added with [method@Gtk.Widget.insert_action_group] will be consulted
 * as well.
 */
public interface ActionableIF{
	/** Get the main Gtk struct */
	public GtkActionable* getActionableStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_actionable_get_type();
	}

	/**
	 * Gets the action name for @actionable.
	 *
	 * Returns: the action name
	 */
	public string getActionName();

	/**
	 * Gets the current target value of @actionable.
	 *
	 * Returns: the current target value
	 */
	public Variant getActionTargetValue();

	/**
	 * Specifies the name of the action with which this widget should be
	 * associated.
	 *
	 * If @action_name is %NULL then the widget will be unassociated from
	 * any previous action.
	 *
	 * Usually this function is used when the widget is located (or will be
	 * located) within the hierarchy of a `GtkApplicationWindow`.
	 *
	 * Names are of the form “win.save” or “app.quit” for actions on the
	 * containing `GtkApplicationWindow` or its associated `GtkApplication`,
	 * respectively. This is the same form used for actions in the `GMenu`
	 * associated with the window.
	 *
	 * Params:
	 *     actionName = an action name
	 */
	public void setActionName(string actionName);

	/**
	 * Sets the target value of an actionable widget.
	 *
	 * If @target_value is %NULL then the target value is unset.
	 *
	 * The target value has two purposes. First, it is used as the parameter
	 * to activation of the action associated with the `GtkActionable` widget.
	 * Second, it is used to determine if the widget should be rendered as
	 * “active” — the widget is active if the state is equal to the given target.
	 *
	 * Consider the example of associating a set of buttons with a `GAction`
	 * with string state in a typical “radio button” situation. Each button
	 * will be associated with the same action, but with a different target
	 * value for that action. Clicking on a particular button will activate
	 * the action with the target of that button, which will typically cause
	 * the action’s state to change to that value. Since the action’s state
	 * is now equal to the target value of the button, the button will now
	 * be rendered as active (and the other buttons, with different targets,
	 * rendered inactive).
	 *
	 * Params:
	 *     targetValue = a `GVariant` to set as the target value
	 */
	public void setActionTargetValue(Variant targetValue);

	/**
	 * Sets the action-name and associated string target value of an
	 * actionable widget.
	 *
	 * @detailed_action_name is a string in the format accepted by
	 * g_action_parse_detailed_name().
	 *
	 * Params:
	 *     detailedActionName = the detailed action name
	 */
	public void setDetailedActionName(string detailedActionName);
}
