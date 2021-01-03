<?php
// This file is part of Moodle - https://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <https://www.gnu.org/licenses/>.

/**
 * Plugin administration pages are defined here.
 *
 * @package     local_edit_course_notification
 * @category    admin
 * @copyright   2020 Tomo Tsuyuki <tomotsuyuki@catalyst-au.net>
 * @license     https://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die();

if ($hassiteconfig) {

    $ADMIN->add('localplugins',
        new admin_category('local_edit_course_notification_settings',
            get_string('pluginname', 'local_edit_course_notification')));
    $settingspage = new admin_settingpage('managelocaleditcoursenotification',
        get_string('pluginname', 'local_edit_course_notification'));

    if ($ADMIN->fulltree) {
        $settingspage->add(new admin_setting_configselect('local_edit_course_notification/notificationtype',
            get_string('setting:notificationtype', 'local_edit_course_notification'),
            get_string('setting:notificationtype_desc', 'local_edit_course_notification'),
            get_string('notificationtype', 'local_edit_course_notification'),
            [
                \core\output\notification::NOTIFY_INFO => 'Information',
                \core\output\notification::NOTIFY_ERROR => 'Error',
                \core\output\notification::NOTIFY_SUCCESS => 'Success',
                \core\output\notification::NOTIFY_WARNING => 'Warning',
            ]
        ));
        $settingspage->add(new admin_setting_configtextarea('local_edit_course_notification/notificationstatement',
            get_string('setting:notificationstatement', 'local_edit_course_notification'),
            get_string('setting:notificationstatement_desc', 'local_edit_course_notification'),
            get_string('notificationstatement', 'local_edit_course_notification')));
    }

    $ADMIN->add('localplugins', $settingspage);
}
