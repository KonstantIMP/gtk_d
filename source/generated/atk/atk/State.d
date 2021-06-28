module atk.State;

private import atk.c.functions;
public  import atk.c.types;
private import glib.Str;
private import glib.c.functions;


/** */
public struct State
{

	/**
	 * Gets the #AtkStateType corresponding to the description string @name.
	 *
	 * Params:
	 *     name = a character string state name
	 *
	 * Returns: an #AtkStateType corresponding to @name
	 */
	public static AtkStateType typeForName(string name)
	{
		return atk_state_type_for_name(Str.toStringz(name));
	}

	/**
	 * Gets the description string describing the #AtkStateType @type.
	 *
	 * Params:
	 *     type = The #AtkStateType whose name is required
	 *
	 * Returns: the string describing the AtkStateType
	 */
	public static string typeGetName(AtkStateType type)
	{
		return Str.toString(atk_state_type_get_name(type));
	}

	/**
	 * Register a new object state.
	 *
	 * Params:
	 *     name = a character string describing the new state.
	 *
	 * Returns: an #AtkState value for the new state.
	 */
	public static AtkStateType typeRegister(string name)
	{
		return atk_state_type_register(Str.toStringz(name));
	}
}
